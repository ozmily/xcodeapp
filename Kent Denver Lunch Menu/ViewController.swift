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

    @IBOutlet weak var monMenu: UITextField!
    @IBOutlet weak var wedMenu: UITextField!
    @IBOutlet weak var friMenu: UITextField!
    @IBOutlet weak var canada: UITextField!
    
    @IBOutlet weak var mexico: UITextField!

    override func viewDidLoad() {
        Alamofire.request("https://sheets.googleapis.com/v4/spreadsheets/1uAwV-1-LsriKcgwnpzMB9ZnR-2jOVlYwJT9HRaCZHpU/values/B1:B6?key=AIzaSyDDwFFTlWwBNvBUWFD-zx67pqodqHDaZX0").responseJSON { response in
            if let JSON = response.result.value {
                let parsedJSON = JSON as! NSDictionary
                let lunch = parsedJSON.object(forKey: "values") as! NSArray
                

                
                self.monMenu.text = String(describing: lunch[0])
                self.canada.text = String(describing: lunch[1])
                self.wedMenu.text = String(describing: lunch[2])
                self.mexico.text = String(describing: lunch[3])
                self.friMenu.text = String(describing: lunch[4])
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

