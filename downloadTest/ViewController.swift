//
//  ViewController.swift
//  downloadTest
//
//  Created by Jake Johnson on 6/18/18.
//  Copyright © 2018 Jake Johnson. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController, WKUIDelegate {
    
    var webView: WKWebView!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = URL(string: "https://www.apple.com")!
        
        let task = URLSession.shared.downloadTask(with: url) { localURL, urlResponse, error in
            if let localURL = localURL {
                if let html = try? String(contentsOf: localURL) {
                    UserDefaults.standard.set(html, forKey: "circuits")
                }
            }
        }
        
        task.resume()
        
        // Setting
        
        let defaults = UserDefaults.standard
        defaults.set("Some String Value", forKey: "circuits")

        // Getting
        
//        let defaults = UserDefaults.standard
//        if let stringOne = defaults.string(forKey: "circuits") {
//            print(stringOne) // Some String Value
//        }

    
    }

}

