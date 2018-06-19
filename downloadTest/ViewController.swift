//
//  ViewController.swift
//  downloadTest
//
//  Created by Jake Johnson on 6/18/18.
//  Copyright © 2018 Jake Johnson. All rights reserved.
//

import UIKit

class ViewController: UIViewController, URLSessionDownloadDelegate {
    
    // Create a FileManager instance
    let fileManager = FileManager.default
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = URL(string: "https://phet.colorado.edu/sims/html/circuit-construction-kit-dc-virtual-lab/latest/circuit-construction-kit-dc-virtual-lab_en.html?download")!
        
        let task = URLSession.shared.downloadTask(with: url) { localURL, urlResponse, error in}
    
        task.resume()
        
    }

    func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didFinishDownloadingTo location: URL) {
        
        let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).last
        
        do{
            try self.fileManager.moveItem(at: location, to: documentsDirectory!)
        }
        catch{
            print("error moving item")
        }
        
    }
    
    


}

