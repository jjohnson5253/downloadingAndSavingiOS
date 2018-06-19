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
    
    var simDict = ["circuits" : "https://phet.colorado.edu/sims/html/circuit-construction-kit-dc/latest/circuit-construction-kit-dc_en.html"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let webConfiguration = WKWebViewConfiguration()

        self.webView = WKWebView(frame: .zero, configuration: webConfiguration)
        
        self.webView.uiDelegate = self
        
        self.view = self.webView

        
        downloadAndSaveSim(url: "https://phet.colorado.edu/sims/html/circuit-construction-kit-dc/latest/circuit-construction-kit-dc_en.html", key: "circuits")
        
        let html = getSim(name: "circuits")
        
        if html != ""{
            webView.loadHTMLString(html, baseURL: nil)
        }
        
    }
    
    func downloadAndSaveSim(url : String, key : String){
        
        let url = URL(string: url)!
        
        let task = URLSession.shared.downloadTask(with: url) { localURL, urlResponse, error in
            if let localURL = localURL {
                if let html = try? String(contentsOf: localURL) {
                    
                    UserDefaults.standard.set(html, forKey: key)
                }
            }
        }
        
        task.resume()

    }
    
    // returns html if available, otherwise returns empty string
    func getSim(name : String) -> String{

        if let html = UserDefaults.standard.string(forKey: name) {
            return html // html Value
        }
        else{
            print("could not find sim html")
            return ""
        }
    }

}

