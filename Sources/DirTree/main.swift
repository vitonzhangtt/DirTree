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
        let size: UInt64 = fileManager.sizeInByte(targetPath)
        
        print("Path: \(targetPath) sizeInByte: \(size)")
        
        let fileTreeSize = fileManager.treeSizeInByte(targetPath)
        print("fileTreeSize: \(fileTreeSize)")
        
        let timesA = String(repeating: "A", count: 5)
        print("timesA: \(timesA)")
        
//        let dirTree: DirTree = DirTree(levelLimit, targetPath:targetPath)
//        dirTree.construct()
//        dirTree.calculate()
//        dirTree.printDirTree()
        
        print("STOP !")
        
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

func pointerOperation2() {
    
    /*
     
    let int: Int = 5
    let p: UnsafeMutablePointer<Int> = UnsafeMutablePointer<Int>.allocate(capacity: 1)
    defer {
        p.deallocate()
    }
    p.pointee = int
    print("p.pointee \(p.pointee)")
     
     */
}


// Tree.main()

// For testing
Tree.main(["/Users/zhangchong/Work/PrivateArea/DirTree/"])
