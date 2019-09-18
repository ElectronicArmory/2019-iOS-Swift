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
    
    @IBOutlet weak var output2Label: UILabel!
    
    var programmaticLabel:UILabel = UILabel()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
//        helloLabel.text = "Boise State "
    }


    @IBAction func loginButtonTapped(_ sender: Any) {
        let username = usernameTextfield.text // <- returns String? so username is of type `String?`
        let password = passwordTextfield.text // <- returns String?
        
        // Calling .text above on usernameTextfield and passwordTextfield
        //  returns a String? or a String optional. Meaning, the string could
        //  come back as nil. Make sure it's not nil and then "unwrap" it to
        //  get to the value inside, using the ! operator.
        if( username != nil && password != nil ){
            let outputString = "Logging in: \(username!) with password: \(password!)"
        
            var logArray = UserLogController.loggingList()
            logArray.append(outputString)
            output2Label.text = logArray[logArray.count-1]
            print(logArray)
            print(UserLogController.loggingList())
            // Log twice
            UserLogController.logNewEvent(newEventToLog: outputString)
        }
        else{
            print("usernameTextfield and/or passwordTextfield have values of nil")
        }
    }
    
    
    @IBAction func signupTapped(_ sender: Any) {
        
        let signupViewController = storyboard?.instantiateViewController(withIdentifier: "SignUpViewController")
        
        self.present(signupViewController!, animated: true, completion: nil)
    }
}


