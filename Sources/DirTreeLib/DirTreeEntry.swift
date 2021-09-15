//
//  DirTreeEntry.swift
//  DirTree
//
//  Created by zhangchong on 2021/9/14.
//

import Foundation

public class DirTreeEntry {
    
    let targetPath: String
    let limit: Int
    let configuration: Configuration
    let logger: DirTreeLogging?
    
    public init(_ targetPath: String, limit: Int, logPath: String? = nil) {
        self.targetPath = targetPath
        self.limit = limit
        self.configuration = Configuration(logPath)
        if let path = configuration.logFile {
            logger = FileLogger(path)
        } else {
            logger = DummyLogger()
        }
    }
    
    public func printDirTree() {
        let dirTree: DirTree = DirTree(limit, targetPath:targetPath, logger: logger)
        dirTree.construct()
        dirTree.calculate()
        dirTree.printDirTree()
    }
}
