//
//  ViewController.swift
//  BitcoinWebservices
//
//  Created by Mike Z on 9/24/19.
//  Copyright © 2019 Boise State. All rights reserved.
//

import UIKit
import Alamofire


class ViewController: UIViewController {
    static let kBPI = "bpi"
    static let kUSD = "USD"
    static let kRATE = "rate_float"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let previousLaunchNumber = UserDefaults.standard.integer(forKey: "LAUNCH_KEY")
        UserDefaults.standard.set(previousLaunchNumber + 1, forKey: "LAUNCH_KEY")
        
        
        AF.request("https://api.coindesk.com/v1/bpi/currentprice.json").responseJSON{ response in
            print(response)
            switch(response.result){
            case let .success(success):
                if( response.response!.statusCode / 100 == 2){
                    let bitcoinObject = success as! Dictionary<AnyHashable, Any>
                
                    let bpiObject:Dictionary = bitcoinObject[ViewController.kBPI] as! Dictionary<String, Any>
                    
                    let timeInfo:Dictionary = bitcoinObject["time"] as! Dictionary<String, Any>
                    let timeString:String = timeInfo["updated"] as! String
                    print(timeString)
                    
                    let usdObject:Dictionary = bpiObject[ViewController.kUSD] as! Dictionary<String, Any>
                    let rate = usdObject[ViewController.kRATE] as! Double
                    let rateString = String(format: "$%.2f", rate)
                    print("\(rateString)")
                }
                
                NotificationCenter.default.post(name: Notification.Name("BITCOIN_LOAD_SUCCESS"), object: response)
                
            case let .failure(error):
                NotificationCenter.default.post(name: Notification.Name("BITCOIN_LOAD_FAILURE"), object: error)
            }
        }
        print("Loading web service")
    }
}

