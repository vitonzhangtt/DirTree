//
//  ViewController.swift
//  DirTree
//
//  Created by vitonzhangtt on 09/14/2021.
//  Copyright (c) 2021 vitonzhangtt. All rights reserved.
//

import UIKit
import DirTree
import Files

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        dirTreePrintTest()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Testing
    func dirTreePrintTest() {
        let levelLimit: Int = 5        
        let libraryPath: [String] = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.libraryDirectory, FileManager.SearchPathDomainMask.userDomainMask, true)
        let firstLibraryPath: String = libraryPath[0]
        let targetPath: String = "\(firstLibraryPath)/Caches"
        
        let entry = DirTreeEntry(targetPath, limit:levelLimit, logPath:nil)
        entry.printDirTree()
    }
}

