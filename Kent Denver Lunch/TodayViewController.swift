//
//  TodayViewController.swift
//  Kent Denver Lunch
//
//  Created by Osamah Zmily on 17/04/2017.
//  Copyright © 2017 Kent Denver Lunch. All rights reserved.
//

import UIKit
import NotificationCenter
import Alamofire



func alamo(url: String) -> String {
    return "Hello, world!"
}

class TodayViewController: UIViewController, NCWidgetProviding {
     
    @IBOutlet var menu: UITextView!
    
    override func viewDidLoad() {
        Alamofire.request("https://sheets.googleapis.com/v4/spreadsheets/1uAwV-1-LsriKcgwnpzMB9ZnR-2jOVlYwJT9HRaCZHpU/values/B1:B5?key=AIzaSyDDwFFTlWwBNvBUWFD-zx67pqodqHDaZX0").responseJSON { response in
            if let JSON = response.result.value {
                let parsedJSON = JSON as! NSDictionary
                let lunch = parsedJSON.object(forKey: "values") as! NSArray
                
                
                
                let dateFormatter = DateFormatter()
                let currentDate = NSDate()
                
                dateFormatter.dateFormat = "EEEE"
                let convertedDate = dateFormatter.string(from: currentDate as Date)
                print(convertedDate)
                
                var wrapper: NSArray
                
                if (convertedDate == "Monday"){
                    wrapper = lunch[0] as! NSArray
                } else if (convertedDate == "Tuesday"){
                    wrapper = lunch[1] as! NSArray
                }
                else if (convertedDate == "Wednesday"){
                    wrapper = lunch[2] as! NSArray
                }
                else if (convertedDate == "Thursday"){
                    wrapper = lunch[3] as! NSArray
                }
                else {
                    wrapper = lunch[4] as! NSArray
                }
                
                let dayMenu = wrapper[0]
                
                self.menu.text = "\(String(describing: convertedDate)): \n\(String(describing: dayMenu)) "
                
            }
        }
        super.viewDidLoad()
//        let d = arc4random_uniform(100);
//        menu.text = String(d);

        // Do any additional setup after loading the view from its nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func widgetPerformUpdate(completionHandler: (@escaping (NCUpdateResult) -> Void)) {
        // Perform any setup necessary in order to update the view.
        // If an error is encountered, use NCUpdateResult.Failed
        // If there's no update required, use NCUpdateResult.NoData
        // If there's an update, use NCUpdateResult.NewData
//        getData(completion: { data in
//            self.request = data
//        })
        
        completionHandler(NCUpdateResult.newData)
    }

    
}

//func getData(completion: @escaping ([String]) -> Void) {
//    Alamofire.request("https://httpbin.org/get").responseJSON { response in
//        guard response.result.isSuccess else {
//            print("Error")
//            completion([String]())
//            return
//        }
//        
//        guard let responseJSON = response.result.value as? [String: Any] else {
//            print("Invalid response");
//            completion([String]())
//            return
//        }
//        
//        print(responseJSON)
//        completion([String]())
//    }
//}
