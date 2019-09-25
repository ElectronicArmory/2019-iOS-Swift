//
//  SignUpViewController.swift
//  InitialView
//
//  Created by Mike Z on 9/17/19.
//  Copyright © 2019 Boise State. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Loading a PList from disk
        let preferencesFilePath =  Bundle.main.path(forResource: "Preferences", ofType: "plist")
        guard FileManager.default.contents(atPath: preferencesFilePath!) != nil else {
            print("file doesn't exist!")
            return
        }

        let plistURL = URL(fileURLWithPath: preferencesFilePath!)
        let data = try! Data(contentsOf: plistURL)
        let plist = try! PropertyListSerialization.propertyList(from: data, options: .mutableContainers, format: nil) as! Dictionary<String, AnyObject>
        
        let placeholder = plist["Placeholder"]
        let serversArray = plist["Servers"]
        
        print(placeholder!)
        print(serversArray!)
    }
    

    @IBAction func signupTapped(_ sender: Any) {
        
        dismiss(animated: true, completion: nil)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
