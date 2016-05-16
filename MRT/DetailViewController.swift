//
//  DetailViewController.swift
//  MRT
//
//  Created by levi on 2016/5/4.
//  Copyright © 2016年 levi. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    @IBOutlet weak var MRTnameLabel: UILabel!
    @IBOutlet weak var lineKeyLabel: UILabel!
    @IBOutlet weak var lineKeyLabel1: UILabel!
    @IBOutlet weak var lineKeyLabel2: UILabel!
    @IBOutlet weak var lineKeyView: UIView!
    @IBOutlet weak var lineKeyView1: UIView!
    @IBOutlet weak var lineKeyView2: UIView!
    
    var mrt: MRT? {
        didSet {
            self.updateValues()
        }
    }

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.updateValues()
    }
    
    func updateValues() {
        guard self.isViewLoaded() else {
            return
        }
        
        self.lineKeyView.backgroundColor = UIColor(red: 158.0/255, green: 101.0/255, blue: 46.0/255, alpha: 0.0)
        self.lineKeyView1.backgroundColor = UIColor(red: 158.0/255, green: 101.0/255, blue: 46.0/255, alpha: 0.0)
        self.lineKeyView2.backgroundColor = UIColor(red: 158.0/255, green: 101.0/255, blue: 46.0/255, alpha: 0.0)
        
        if mrt?.lineKeys.count < 2 {
            self.MRTnameLabel.text = mrt?.name
            self.lineKeyLabel.text = mrt?.lineKeys[0]
            self.lineKeyLabel1.text = ""
            self.lineKeyLabel2.text = ""
            labelColor(i : 0)
        }
        
        if mrt?.lineKeys.count > 1 {
            self.MRTnameLabel.text = mrt?.name
            self.lineKeyLabel.text = ""
            self.lineKeyLabel1.text = mrt?.lineKeys[0]
            self.lineKeyLabel2.text = mrt?.lineKeys[1]
            twoLabelColor()
        }
        
        
        
    }
    
    func labelColor(i j:Int) {
        if mrt?.lineKeys[j] == "文湖線"{
            self.lineKeyView.backgroundColor = UIColor(red: 158.0/255, green: 101.0/255, blue: 46.0/255, alpha: 1.0)
        }
        if mrt?.lineKeys[j] == "淡水信義線"{
            self.lineKeyView.backgroundColor = UIColor(red: 203.0/255, green: 44.0/255, blue: 48.0/255, alpha: 1.0)
        }
        if mrt?.lineKeys[j] == "新北投支線"{
            self.lineKeyView.backgroundColor = UIColor(red: 248.0/255, green: 144.0/255, blue: 165.0/255, alpha: 1.0)
        }
        if mrt?.lineKeys[j] == "松山新店線"{
            self.lineKeyView.backgroundColor = UIColor(red: 0.0/255, green: 119.0/255, blue: 73.0/255, alpha: 1.0)
        }
        if mrt?.lineKeys[j] == "小碧潭支線"{
            self.lineKeyView.backgroundColor = UIColor(red: 206.0/255, green: 220.0/255, blue: 0.0/255, alpha: 1.0)
        }
        if mrt?.lineKeys[j] == "中和新蘆線"{
            self.lineKeyView.backgroundColor = UIColor(red: 255.0/255, green: 163.0/255, blue: 0.0/255, alpha: 1.0)
        }
        if mrt?.lineKeys[j] == "板南線"{
            self.lineKeyView.backgroundColor = UIColor(red: 0.0/255, green: 94.0/255, blue: 184.0/255, alpha: 1.0)
        }
        if mrt?.lineKeys[j] == "貓空纜車"{
            self.lineKeyView.backgroundColor = UIColor(red: 119.0/255, green: 185.0/255, blue: 51.0/255, alpha: 1.0)
        }
    }
    
    func twoLabelColor() {
        if mrt?.lineKeys[0] == "文湖線"{
            self.lineKeyView1.backgroundColor = UIColor(red: 158.0/255, green: 101.0/255, blue: 46.0/255, alpha: 1.0)
        }
        if mrt?.lineKeys[0] == "淡水信義線"{
            self.lineKeyView1.backgroundColor = UIColor(red: 203.0/255, green: 44.0/255, blue: 48.0/255, alpha: 1.0)
        }
        if mrt?.lineKeys[0] == "新北投支線"{
            self.lineKeyView1.backgroundColor = UIColor(red: 248.0/255, green: 144.0/255, blue: 165.0/255, alpha: 1.0)
        }
        if mrt?.lineKeys[0] == "松山新店線"{
            self.lineKeyView1.backgroundColor = UIColor(red: 0.0/255, green: 119.0/255, blue: 73.0/255, alpha: 1.0)
        }
        if mrt?.lineKeys[0] == "小碧潭支線"{
            self.lineKeyView1.backgroundColor = UIColor(red: 206.0/255, green: 220.0/255, blue: 0.0/255, alpha: 1.0)
        }
        if mrt?.lineKeys[0] == "中和新蘆線"{
            self.lineKeyView1.backgroundColor = UIColor(red: 255.0/255, green: 163.0/255, blue: 0.0/255, alpha: 1.0)
        }
        if mrt?.lineKeys[0] == "板南線"{
            self.lineKeyView1.backgroundColor = UIColor(red: 0.0/255, green: 94.0/255, blue: 184.0/255, alpha: 1.0)
        }
        if mrt?.lineKeys[0] == "貓空纜車"{
            self.lineKeyView1.backgroundColor = UIColor(red: 119.0/255, green: 185.0/255, blue: 51.0/255, alpha: 1.0)
        }
        
        if mrt?.lineKeys[1] == "文湖線"{
            self.lineKeyView2.backgroundColor = UIColor(red: 158.0/255, green: 101.0/255, blue: 46.0/255, alpha: 1.0)
        }
        if mrt?.lineKeys[1] == "淡水信義線"{
            self.lineKeyView2.backgroundColor = UIColor(red: 203.0/255, green: 44.0/255, blue: 48.0/255, alpha: 1.0)
        }
        if mrt?.lineKeys[1] == "新北投支線"{
            self.lineKeyView2.backgroundColor = UIColor(red: 248.0/255, green: 144.0/255, blue: 165.0/255, alpha: 1.0)
        }
        if mrt?.lineKeys[1] == "松山新店線"{
            self.lineKeyView2.backgroundColor = UIColor(red: 0.0/255, green: 119.0/255, blue: 73.0/255, alpha: 1.0)
        }
        if mrt?.lineKeys[1] == "小碧潭支線"{
            self.lineKeyView2.backgroundColor = UIColor(red: 206.0/255, green: 220.0/255, blue: 0.0/255, alpha: 1.0)
        }
        if mrt?.lineKeys[1] == "中和新蘆線"{
            self.lineKeyView2.backgroundColor = UIColor(red: 255.0/255, green: 163.0/255, blue: 0.0/255, alpha: 1.0)
        }
        if mrt?.lineKeys[1] == "板南線"{
            self.lineKeyView2.backgroundColor = UIColor(red: 0.0/255, green: 94.0/255, blue: 184.0/255, alpha: 1.0)
        }
        if mrt?.lineKeys[1] == "貓空纜車"{
            self.lineKeyView2.backgroundColor = UIColor(red: 119.0/255, green: 185.0/255, blue: 51.0/255, alpha: 1.0)
        }


    }

}
