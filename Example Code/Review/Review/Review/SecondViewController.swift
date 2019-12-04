//
//  SecondViewController.swift
//  Review
//
//  Created by Mike Z on 12/3/19.
//  Copyright © 2019 Boise State. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UINavigationControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = "Details"
        
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        <#code#>
    }
    @IBAction func backTapped(_ sender: Any) {
        
        navigationController?.popToRootViewController(animated: true)
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
