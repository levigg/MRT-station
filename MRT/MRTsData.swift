//
//  MRTsData.swift
//  MRT
//
//  Created by levi on 2016/5/8.
//  Copyright © 2016年 levi. All rights reserved.
//

import Foundation
import SwiftyJSON

struct Line {
    let name: String
    let MRTs: [MRT]
}

struct MRT {
    let name: String
    var lineKeys = [String]()
    var lineValues = [String]()
    
    init?(fromData jsonData: JSON, arrayNumber j: Int){
        if let name = (jsonData[j]["name"].string){
            self.name = name
        }else{
            return nil
        }
        
        if let lineKeys = (jsonData[j]["lines"].dictionary){
            for key in lineKeys.keys{
                self.lineKeys.append(key)
            }
        }else{
            print(jsonData[j]["lines"].dictionary)
        }
        
        if let lineValues = (jsonData[j]["lines"].dictionary){
            for value in lineValues.values{
                if let valueString = value.string{
                    self.lineValues.append(valueString)
                }else{
                    return nil
                }
            }
        }else{
            print(jsonData[j]["lines"].dictionary)
        }
    }
}

enum MRTsSourceErrorType: ErrorType {
    case FileNotFound
    case InvalidContent
}

struct MRTsSource {
    let lines: [Line]
    
    init(contentsOfFile path: String) throws {
        let jsonData = NSData(contentsOfFile: path) as NSData!
        let readableJSON = JSON(data: jsonData, options: NSJSONReadingOptions.MutableContainers, error: nil)
        
        let numberOfDatas = readableJSON[].count
        var lineMRTMap = [String: [MRT]]()
        
        for i in 0..<numberOfDatas{
            
            guard let mrt = MRT(fromData: readableJSON, arrayNumber: i) else {
                throw MRTsSourceErrorType.InvalidContent
            }
            if lineMRTMap[mrt.lineKeys[0]] == nil {
                // Create an array to put airport by country name
                lineMRTMap[mrt.lineKeys[0]] = []
            }
            if mrt.lineValues.count > 1 {
            if lineMRTMap[mrt.lineKeys[1]] == nil {
                // Create an array to put airport by country name
                lineMRTMap[mrt.lineKeys[1]] = []
            }
            }
            lineMRTMap[mrt.lineKeys[0]]?.append(mrt)
            if mrt.lineKeys.count > 1 {
            lineMRTMap[mrt.lineKeys[1]]?.append(mrt)
            }
        }

        var _lines = [Line]()
        for (lineKeys, MRTs) in lineMRTMap {
            let line = Line(name: lineKeys, MRTs: MRTs)
            _lines.append(line)
        }
        self.lines = _lines.sort { (lineA: Line, lineB: Line) -> Bool in
            return lineA.name < lineB.name
        }
        
        
    }
}




