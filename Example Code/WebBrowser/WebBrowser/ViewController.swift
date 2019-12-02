//
//  ViewController.swift
//  WebBrowser
//
//  Created by Mike Z on 10/29/19.
//  Copyright © 2019 Boise State. All rights reserved.
//

import UIKit


import WebKit


class ViewController: UIViewController, WKNavigationDelegate, WKUIDelegate {

    @IBOutlet weak var urlTextField: UITextField!
    @IBOutlet weak var backButton: UIButton!
    
    
    @IBOutlet weak var forwardButton: UIButton!
    
    @IBOutlet weak var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        backButton.isEnabled = webView.canGoBack
        forwardButton.isEnabled = webView.canGoForward
        
//        webView.load(URLRequest(url: URL(string: "http://electronicarmory.com")!))
        
        
        
    }

    
    override func viewDidAppear(_ animated: Bool) {
        
        if let url = URL(string: "ftpboisestate"){
        
            if( UIApplication.shared.canOpenURL(url) ){
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
            }
            else{
                
            }
        }
    }

}

