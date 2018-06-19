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
    
    let documentsPath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!

    var downloadSession = URLSession()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        let url = URL(string: "https://phet.colorado.edu/sims/html/circuit-construction-kit-dc-virtual-lab/latest/circuit-construction-kit-dc-virtual-lab_en.html?download")!
        
        
        let task = downloadSession.shared.downloadTask(with: url) { localURL, urlResponse, error in}
    
        
        task.resume()
        
    }
    
    func localFilePath(for url: URL) -> URL {
        return documentsPath.appendingPathComponent(url.lastPathComponent)
    }

    func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didFinishDownloadingTo location: URL) {
        
        guard let sourceURL = downloadTask.originalRequest?.url else { return }

        // 2
        let destinationURL = localFilePath(for: sourceURL)
        print(destinationURL)
        // 3
        try? fileManager.removeItem(at: destinationURL)
        do {
            try fileManager.copyItem(at: location, to: destinationURL)
//            download?.track.downloaded = true
        } catch let error {
            print("Could not copy file to disk: \(error.localizedDescription)")
        }
        // 4
//        if let index = download?.track.index {
//            DispatchQueue.main.async {
//                self.tableView.reloadRows(at: [IndexPath(row: index, section: 0)], with: .none)
//            }
//        }
        
    }
    
    


}

