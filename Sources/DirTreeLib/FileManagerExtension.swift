//
//  File.swift
//  
//
//  Created by zhangchong on 2021/8/19.
//

import Foundation

// Extensions for FileManager.
public extension FileManager {
    
    /**
     Return `true`, if the path is a directory.
     */
    func isDirectory(_ path: String) -> Bool {
        return fileType(path) == .typeDirectory
    }
    
    /**
     Return the type attribute of file which is identified by `path`.
     */
    private func fileType(_ path: String) -> FileAttributeType {
        
        // FileAttributeType
        // Values representing a file’s type attribute.
        // https://developer.apple.com/documentation/foundation/fileattributetype
        var type: FileAttributeType = .typeUnknown
        
        do {
            let fileAttributes = try attributesOfItem(atPath: path)
            
            // Get the type.
            if let fileType = fileAttributes[FileAttributeKey.type] {
                type = fileType as! FileAttributeType
            }
        } catch {
            // Do nothing!!!
            print("Error when get attributes of item: \(path)")
        }
        return type
    }
    
    /**
     Return the size of file or directory which is identified by `path` in bytes.
     */
    func sizeInByte(_ path: String) -> UInt64 {
        
        var size: UInt64 = 0
        
        do {
            let fileAttributes = try attributesOfItem(atPath: path)
            
            // Get the size of file or directory.
            if let fileSize = fileAttributes[FileAttributeKey.size] {
                size = (fileSize as! NSNumber).uint64Value
            }
        } catch {
            // Do nothing!!!
        }
        return size
    }
    
    /**
     Return the creation date of this `path`.
     */
    func creationDate(_ path: String) -> Date {
        
        var date: Date = Date.distantPast
        
        do {
            let fileAttributes = try attributesOfItem(atPath: path)
            if let creationDate = fileAttributes[FileAttributeKey.creationDate] {
                date = creationDate as! Date
            }
        } catch {
            /// Do nothing!!!
        }
        return date
    }
    
    /**
     Return the size of files tree in byte.
     The files tree which contains directory itself, files and subdirectories.
     */
    func treeSizeInByte(_ directoryPath: String) -> UInt64 {
/*
        // Calculate the size of directory itself.
        var size: UInt64 = sizeInByte(directoryPath)
        let folder: Folder? = try? Folder(path: directoryPath)
        
        // Calculate the size of all files and subdirectroies.
        if let realFolder = folder {
            realFolder.subfolders.forEach { (subfolder: Folder) in
                let subfolderSize = treeSizeInByte(subfolder.path)
                size = size + subfolderSize
            }
            
            realFolder.files.forEach { (file: File) in
                let fileSize = sizeInByte(file.path)
                size = size + fileSize
            }
        }
        return size
*/
        var size: UInt64 = sizeInByte(directoryPath)
        let folder: Folder = Folder(path: directoryPath)
        
        // subfolders
        folder.subFolders.forEach { (subfolder :Folder) in
            let subfolderSize = treeSizeInByte(subfolder.path)
            size = size + subfolderSize
        }
        
        // files
        folder.files.forEach { (file :File) in
            let fileSize = sizeInByte(file.path)
            size = size + fileSize
        }
        
        return size
    }
}
