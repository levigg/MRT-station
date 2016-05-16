//
//  ViewController.swift
//  MRT
//
//  Created by levi on 2016/4/28.
//  Copyright © 2016年 levi. All rights reserved.
//

import SwiftyJSON
import UIKit

class ViewController: UITableViewController {
    
    var MRTsData: MRTsSource!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let path : String = NSBundle.mainBundle().pathForResource("MRT", ofType: "json") as String!
        guard let MRTsSource = try? MRTsSource(contentsOfFile: path) else {
            fatalError()
        }
        self.MRTsData = MRTsSource
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return self.MRTsData.lines.count
    }
    
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.MRTsData.lines[section].MRTs.count
    }
    
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("MRTcell") as! TableViewCell
        let MRT = self.MRTsData.lines[indexPath.section].MRTs[indexPath.row]
        
        
        cell.MRTnameLabel.text = MRT.name
        
        
        if MRT.lineKeys.count < 2 {
            cell.lineValueLabel.text = MRT.lineValues[0]
            cell.lineValueLabel2.text = ""
            cell.lineKeyView2.backgroundColor = UIColor(red: 158.0/255, green: 101.0/255, blue: 46.0/255, alpha: 0.0)
            
            if MRT.lineKeys[0] == "文湖線"{
                cell.lineKeyView.backgroundColor = UIColor(red: 158.0/255, green: 101.0/255, blue: 46.0/255, alpha: 1.0)
            }
            if MRT.lineKeys[0] == "淡水信義線"{
                cell.lineKeyView.backgroundColor = UIColor(red: 203.0/255, green: 44.0/255, blue: 48.0/255, alpha: 1.0)
            }
            if MRT.lineKeys[0] == "新北投支線"{
                cell.lineKeyView.backgroundColor = UIColor(red: 248.0/255, green: 144.0/255, blue: 165.0/255, alpha: 1.0)
            }
            if MRT.lineKeys[0] == "松山新店線"{
                cell.lineKeyView.backgroundColor = UIColor(red: 0.0/255, green: 119.0/255, blue: 73.0/255, alpha: 1.0)
            }
            if MRT.lineKeys[0] == "小碧潭支線"{
                cell.lineKeyView.backgroundColor = UIColor(red: 206.0/255, green: 220.0/255, blue: 0.0/255, alpha: 1.0)
            }
            if MRT.lineKeys[0] == "中和新蘆線"{
                cell.lineKeyView.backgroundColor = UIColor(red: 255.0/255, green: 163.0/255, blue: 0.0/255, alpha: 1.0)
            }
            if MRT.lineKeys[0] == "板南線"{
                cell.lineKeyView.backgroundColor = UIColor(red: 0.0/255, green: 94.0/255, blue: 184.0/255, alpha: 1.0)
            }
            if MRT.lineKeys[0] == "貓空纜車"{
                cell.lineKeyView.backgroundColor = UIColor(red: 119.0/255, green: 185.0/255, blue: 51.0/255, alpha: 1.0)
            }

            
        }
        
        if MRT.lineKeys.count > 1 {
            cell.lineValueLabel.text = MRT.lineValues[0]
            cell.lineValueLabel2.text = MRT.lineValues[1]
            
            if MRT.lineKeys[0] == "文湖線"{
                cell.lineKeyView.backgroundColor = UIColor(red: 158.0/255, green: 101.0/255, blue: 46.0/255, alpha: 1.0)
            }
            if MRT.lineKeys[0] == "淡水信義線"{
                cell.lineKeyView.backgroundColor = UIColor(red: 203.0/255, green: 44.0/255, blue: 48.0/255, alpha: 1.0)
            }
            if MRT.lineKeys[0] == "新北投支線"{
                cell.lineKeyView.backgroundColor = UIColor(red: 248.0/255, green: 144.0/255, blue: 165.0/255, alpha: 1.0)
            }
            if MRT.lineKeys[0] == "松山新店線"{
                cell.lineKeyView.backgroundColor = UIColor(red: 0.0/255, green: 119.0/255, blue: 73.0/255, alpha: 1.0)
            }
            if MRT.lineKeys[0] == "小碧潭支線"{
                cell.lineKeyView.backgroundColor = UIColor(red: 206.0/255, green: 220.0/255, blue: 0.0/255, alpha: 1.0)
            }
            if MRT.lineKeys[0] == "中和新蘆線"{
                cell.lineKeyView.backgroundColor = UIColor(red: 255.0/255, green: 163.0/255, blue: 0.0/255, alpha: 1.0)
            }
            if MRT.lineKeys[0] == "板南線"{
                cell.lineKeyView.backgroundColor = UIColor(red: 0.0/255, green: 94.0/255, blue: 184.0/255, alpha: 1.0)
            }
            if MRT.lineKeys[0] == "貓空纜車"{
                cell.lineKeyView.backgroundColor = UIColor(red: 119.0/255, green: 185.0/255, blue: 51.0/255, alpha: 1.0)
            }
            
            if MRT.lineKeys[1] == "文湖線"{
                cell.lineKeyView2.backgroundColor = UIColor(red: 158.0/255, green: 101.0/255, blue: 46.0/255, alpha: 1.0)
            }
            if MRT.lineKeys[1] == "淡水信義線"{
                cell.lineKeyView2.backgroundColor = UIColor(red: 203.0/255, green: 44.0/255, blue: 48.0/255, alpha: 1.0)
            }
            if MRT.lineKeys[1] == "新北投支線"{
                cell.lineKeyView2.backgroundColor = UIColor(red: 248.0/255, green: 144.0/255, blue: 165.0/255, alpha: 1.0)
            }
            if MRT.lineKeys[1] == "松山新店線"{
                cell.lineKeyView2.backgroundColor = UIColor(red: 0.0/255, green: 119.0/255, blue: 73.0/255, alpha: 1.0)
            }
            if MRT.lineKeys[1] == "小碧潭支線"{
                cell.lineKeyView2.backgroundColor = UIColor(red: 206.0/255, green: 220.0/255, blue: 0.0/255, alpha: 1.0)
            }
            if MRT.lineKeys[1] == "中和新蘆線"{
                cell.lineKeyView2.backgroundColor = UIColor(red: 255.0/255, green: 163.0/255, blue: 0.0/255, alpha: 1.0)
            }
            if MRT.lineKeys[1] == "板南線"{
                cell.lineKeyView2.backgroundColor = UIColor(red: 0.0/255, green: 94.0/255, blue: 184.0/255, alpha: 1.0)
            }
            if MRT.lineKeys[1] == "貓空纜車"{
                cell.lineKeyView2.backgroundColor = UIColor(red: 119.0/255, green: 185.0/255, blue: 51.0/255, alpha: 1.0)
            }

            
        }
        
        return cell
    }
    
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return self.MRTsData.lines[section].name
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        guard let segueIdentifier = segue.identifier else {
            return
        }
        
        if segueIdentifier == "ShowDetail" {
            guard let detailViewController = segue.destinationViewController as? DetailViewController else {
                return
            }
            guard let cell = sender as? UITableViewCell else { return }
            let indexPath = self.tableView.indexPathForCell(cell)!
            let mrt = self.MRTsData.lines[indexPath.section].MRTs[indexPath.row]
            detailViewController.mrt = mrt
        }
    }
    
    


}

