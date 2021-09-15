//
//  IndexNode.swift
//  
//
//  Created by zhangchong on 2021/8/19.
//

import Foundation
import Files

enum FileType {
    case folder(folder: Folder?)
    case file(file: File?)
}

final class IndexNode: Devideble {
    
    var sizeInByte: UInt64
    var path: String
    var isFolder: Bool
    var fileType: FileType
    
    init(path: String) {
        self.path = path
        sizeInByte = 0
        isFolder = FileManager.default.isDirectory(path)
        fileType = isFolder ? .folder(folder: try? Folder(path: path))
                            : .file(file: try? File(path: path))
    }
    
    private func files() -> [String]? {
        var files: [String] = []
        if isFolder {
            if case let .folder(folder) = fileType {
                if let realFolder = folder {
                    realFolder.files.forEach { (file: File) in
                        files.append(file.path)
                    }
                }
            }
        }
        let result = files.isEmpty ? nil : files
        return result
    }
    
    private func subfolders() -> [String]? {
        
        var subfolders: [String] = []
        
        if isFolder {
            if case let .folder(folder) = fileType {
                if let realFolder = folder {
                    realFolder.subfolders.forEach { (folder: Folder) in
                        subfolders.append(folder.path)
                    }
                }
            }
        }
        let result = subfolders.isEmpty ? nil : subfolders
        return result
    }
    
    // MARK: - CustomStringConvertible
    public var description: String {
        let description: String = "[\(sizeInByte)] \(shortName())"
        return description
    }
    
    // MARK: - Devideble
    public func elements() -> [IndexNode]? {
        var elements: [IndexNode] = []
        
        if let files = files() {
            files.forEach { (path: String) in
                let inode = IndexNode(path: path)
                elements.append(inode)
            }
        }
        
        if let subfolders = subfolders() {
            subfolders.forEach { (path: String) in
                let inode = IndexNode(path: path)
                elements.append(inode)
            }
        }
        
        let result = elements.isEmpty ? nil : elements
        return result
    }
    
    public func isAtomic() -> Bool {
        return !self.isFolder
    }
    
    /**
     Return the short name of this IndexNode.
     Now it return the last component in the path
     */
    public func shortName() -> String {
        switch fileType {
        case .file(let file):
            if let realFile = file {
                return realFile.name
            }
            
        case .folder(let folder):
            if let realFolder = folder {
                return realFolder.name
            }
        }
        assert(false, "The file or folder is nil!")
        return ""
    }
    
    /**
     Return the full name of this IndexNode.
     Now it return the full path for file and folder.
     */
    public func fullName() -> String {
        switch fileType {
        case .file(let file):
            if let realFile = file {
                return realFile.path
            }
        case .folder(let folder):
            if let realFolder = folder {
                return realFolder.path
            }
        }
        assert(false, "The file or folder is nil!")
        return ""
    }
    
    /**
     Calculate the size of this IndexNode.
     If this IndexNode object is a folder, `sizeInByte` is the sum of size of folder self
     and size of all files and subfolders.
     */
    public func run() {
        switch fileType {
        case .file(let file):
            if let realFile = file {
                sizeInByte = FileManager.default.sizeInByte(realFile.path)
                return
            }
        case .folder(let folder):
            if let realFolder = folder {
                sizeInByte = FileManager.default.treeSizeInByte(realFolder.path)
                return
            }
        }
        assert(false, "The file or folder is nil!")
    }
    
    /**
     Return the size of the tree of which the root is this IndexNode object.
     For `.file`, `treeSize` is the same as `nodeSize`.
     For `.folder`, `treeSize` is the sum of `nodeSize` and size of each file and subfloder in this folder.
     */
    public func treeSize() -> UInt64 {
        return sizeInByte
    }
    
    public func setTreeSize(_ size: UInt64) {
        sizeInByte = size
    }
    
    public func nodeSize() -> UInt64 {
        let size: UInt64 = FileManager.default.sizeInByte(path)
        return size
    }
}
