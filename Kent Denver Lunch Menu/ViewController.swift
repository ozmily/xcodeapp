//
//  ViewController.swift
//  Kent Denver Lunch Menu
//
//  Created by Osamah Zmily on 17/04/2017.
//  Copyright © 2017 Kent Denver Lunch. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController {

    
    @IBOutlet weak var monMenu: UITextView!
    
    @IBOutlet weak var canada: UITextView!
    
    @IBOutlet weak var wedMenu: UITextView!

    @IBOutlet weak var mexico: UITextView!
    
    @IBOutlet weak var friMenu: UITextView!
    
    override func viewDidLoad() {
        Alamofire.request("https://sheets.googleapis.com/v4/spreadsheets/1uAwV-1-LsriKcgwnpzMB9ZnR-2jOVlYwJT9HRaCZHpU/values/B1:B6?key=AIzaSyDDwFFTlWwBNvBUWFD-zx67pqodqHDaZX0").responseJSON { response in
            if let JSON = response.result.value {
                let parsedJSON = JSON as! NSDictionary
                let lunch = parsedJSON.object(forKey: "values") as! NSArray
               
                var wrapper1: NSArray
                var wrapper2: NSArray
                var wrapper3: NSArray
                var wrapper4: NSArray
                var wrapper5: NSArray
                
                wrapper1 = lunch[0] as! NSArray
                wrapper2 = lunch[1] as! NSArray
                wrapper3 = lunch[2] as! NSArray
                wrapper4 = lunch[3] as! NSArray
                wrapper5 = lunch[4] as! NSArray
                
                let dayMenu1 = wrapper1[0]
                let dayMenu2 = wrapper2[0]
                let dayMenu3 = wrapper3[0]
                let dayMenu4 = wrapper4[0]
                let dayMenu5 = wrapper5[0]
                
                self.monMenu.text = "\(String(describing: dayMenu1)) "
                self.canada.text = "\(String(describing: dayMenu2)) "
                self.wedMenu.text = "\(String(describing: dayMenu3)) "
                self.mexico.text = "\(String(describing: dayMenu4)) "
                self.friMenu.text = "\(String(describing: dayMenu5)) "
            }
        }
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

