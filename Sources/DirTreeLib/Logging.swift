//
//  Logging.swift
//  
//
//  Created by zhangchong on 2021/9/14.
//

import Foundation

protocol DirTreeLogging {
    /// logging the item
    func log(_ item: String)
}


// MARK: - File Output Stream
struct FileHandlerOutputStream: TextOutputStream {
    private let fileHandle: FileHandle
    let encoding: String.Encoding

    init(_ fileHandle: FileHandle, encoding: String.Encoding = .utf8) {
        self.fileHandle = fileHandle
        self.encoding = encoding
    }

    mutating func write(_ string: String) {
        if let data = string.data(using: encoding) {
            fileHandle.write(data)
        }
    }
}

// MARK: - File Logger
class FileLogger: DirTreeLogging {
    
    var outputStream: FileHandlerOutputStream
    let fileHandle: FileHandle
    
    init?(_ path: String) {
        
        /// Create the log file into which the `dir tree` will be written.
        let _ = FileManager.default.createFile(atPath: path,
                                                  contents: nil,
                                                  attributes: nil)
        
        do {
            /// Create the Output Stream for `print` function.
            let url = URL(fileURLWithPath: path)
            fileHandle = try FileHandle(forWritingTo: url)
            outputStream = FileHandlerOutputStream(fileHandle)
        } catch {
            return nil
        }
    }
    
    // MARK: - DirTreeLogging
    func log(_ item: String) {
        Swift.print(item, to: &outputStream)
    }
}

// MARK: - Dummy Logger
class DummyLogger: DirTreeLogging {
    
    // MARK: - DirTreeLogging
    func log(_ item: String) {
        Swift.print(item)
    }
}
