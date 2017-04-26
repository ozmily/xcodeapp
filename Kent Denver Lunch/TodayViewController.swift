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
   
    @IBOutlet var menu: UILabel!
  
    
    override func viewDidLoad() {
        Alamofire.request("https://sheets.googleapis.com/v4/spreadsheets/1S_NuQRntEzbvWwR_gdig8g-_l1dxavw1qqTqt_PuuL4/values/B2:B6?key=AIzaSyDDwFFTlWwBNvBUWFD-zx67pqodqHDaZX0").responseJSON { response in
            if let JSON = response.result.value {
                self.menu.text = "lunch: \(JSON)"
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
        let d = arc4random_uniform(100);
        menu.text = String(d);
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
