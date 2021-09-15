//
//  ViewController.swift
//  DirTree
//
//  Created by vitonzhangtt on 09/14/2021.
//  Copyright (c) 2021 vitonzhangtt. All rights reserved.
//

import UIKit
import DirTree

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
        let targetPath: String = NSHomeDirectory()
        print("targetPath: \(targetPath)")
        let logPath: String = "\(NSTemporaryDirectory())/DirTree.txt"
        
        let entry = DirTreeEntry(targetPath, limit:levelLimit, logPath:logPath)
        entry.printDirTree()
    }
}

