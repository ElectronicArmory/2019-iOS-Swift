//
//  ViewController.swift
//  InitialView
//
//  Created by Mike Z on 9/3/19.
//  Copyright © 2019 Boise State. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var helloLabel: UILabel!
    
    @IBOutlet weak var usernameTextfield: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
    
    @IBOutlet weak var outputLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
//        helloLabel.text = "Boise State "
    }


    @IBAction func loginButtonTapped(_ sender: Any) {
        let username = usernameTextfield.text
        let password = passwordTextfield.text
        
        outputLabel.text = "Logging in: \(username!) with password: \(password)"
        
    }
}


