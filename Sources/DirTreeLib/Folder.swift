//
//  Folder.swift
//  
//
//  Created by zhangchong on 2021/9/18.
//

import Foundation


class Folder {
    
    let path: String
    lazy var name: String = {
        let url = URL(fileURLWithPath: path)
        let lastComponent = url.lastPathComponent
        return lastComponent
    }()
    
    lazy var subFolders: [Folder] = scanSubFolders()
    lazy var files: [File] = scanFiles()
    
    init(path: String) {
        self.path = path
    }
    
    func scanSubFolders() -> [Folder] {
        
        /// Define a empty array for the subFolder.
        var subFolders: [Folder] = []
        let fileManager = FileManager.default
        
        let contents = try? fileManager.contentsOfDirectory(atPath: path)
        let itemNames = contents?.sorted() ?? []
        for itemName in itemNames {
            var itemPath: String
            if path.hasSuffix("/") {
                itemPath = path + itemName
            } else {
                itemPath = path + "/\(itemName)"
            }
            
            if fileManager.isDirectory(itemPath) {
                let subFolder: Folder = Folder(path: itemPath)
                subFolders.append(subFolder)
            }
        }
        
        return subFolders
    }
    
    func scanFiles() -> [File] {
        var files: [File] = []
        let fileManager = FileManager.default
        
        let contents = try? fileManager.contentsOfDirectory(atPath: path)
        let itemNames = contents?.sorted() ?? []
        for itemName in itemNames {
            var itemPath: String
            if path.hasSuffix("/") {
                itemPath = path + itemName
            } else {
                itemPath = path + "/\(itemName)"
            }
            
            if !fileManager.isDirectory(itemPath) {
                let subFolder: File = File(path: itemPath)
                files.append(subFolder)
            }
        }
        
        return files
    }
}
