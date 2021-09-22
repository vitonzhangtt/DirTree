import Foundation
import ArgumentParser
import DirTreeLib


print("Hello DirTree!")

struct Tree: ParsableCommand {
    
    @Flag(name: .short)
    var verbose = false
    
    @Option(name: [.customLong("level"), .customShort("l")])
    var levelCount: Int?
    
    @Argument
    var targetPath: String
    
    private var defaultLevelLimit: Int = 5
    
    mutating func run() throws {
        let levelLimit = levelCount ?? defaultLevelLimit
        print("Path: \(targetPath) Level: \(levelLimit)")
        
        let fileManager: FileManager = FileManager.default
//        let size: UInt64 = fileManager.sizeInByte(targetPath)
        
//        print("Path: \(targetPath) sizeInByte: \(size)")
        
//        let fileTreeSize = fileManager.treeSizeInByte(targetPath)
//        print("fileTreeSize: \(fileTreeSize)")
        
        let timesA = String(repeating: "A", count: 5)
        print("timesA: \(timesA)")
        
        let entry = DirTreeEntry(targetPath, limit: 5, logPath: nil)
        entry.printDirTree()
        
/*
        
        /// Deep enumeration
        let enumerator = FileManager.default.enumerator(atPath: targetPath)
        if let realEnumerator = enumerator {
            while let file = realEnumerator.nextObject() as? String {
                print("Filename: \(file)")
            }
        }
*/
        /// Shallow search
//        let contents = try? fileManager.contentsOfDirectory(atPath: targetPath)
//        let names = contents?.sorted() ?? []
//        print("names: ")
//        print("\(names)")
        
    }
}

func pointerOperation() {
    
    var i: Int = 5
    withUnsafePointer(to: &i) { pointer -> Void in
        print("pointer.pointee: \(pointer.pointee)")
    }
    
    withUnsafeMutablePointer(to: &i) { mutablePointer -> Void in
        print("mutablePointer.pointee: \(mutablePointer.pointee)")
        mutablePointer.pointee = 6
        print("mutablePointer.pointee: \(mutablePointer.pointee)")
    }
    
    print("i: \(i)")
}

// Tree.main()

// For testing
Tree.main(["/Users/zhangchong/Work/PrivateArea/DirTree/"])
