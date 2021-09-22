//
//  DirTreeEntry.swift
//  DirTree
//
//  Created by zhangchong on 2021/9/14.
//

import Foundation

@objc
public class DirTreeEntry: NSObject {
    
    let targetPath: String
    let limit: Int
    let configuration: Configuration
    let logger: DirTreeLogging?
    
    @objc
    public init(targetPath: String, limit: Int, logPath: String? = nil) {
        self.targetPath = targetPath
        self.limit = limit
        self.configuration = Configuration(logPath)
        if let path = configuration.logFile {
            logger = FileLogger(path)
        } else {
            logger = DummyLogger()
        }
    }
    
    @objc
    public func printDirTree() {
        let dirTree: DirTree = DirTree(limit, targetPath:targetPath, logger: logger)
        dirTree.construct()
        dirTree.calculate()
        dirTree.printDirTree()
    }
}
