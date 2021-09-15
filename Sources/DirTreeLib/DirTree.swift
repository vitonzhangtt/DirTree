//
//  DirTree.swift
//  
//
//  Created by zhangchong on 2021/8/19.
//

import Foundation

/**
 There are three steps to use this class:
     1. Construction
     2. Calculation
     3. Printing
 */
class DirTree {
    
    var root: Node<IndexNode>
    var levelLimit: Int = 0
    var indentPerLevel: Int = 4
    let logger: DirTreeLogging?
    
    /**
     
     */
    init(_ limit: Int, targetPath: String, logger: DirTreeLogging?) {
        levelLimit = limit
        let inode = IndexNode(path: targetPath)
        root = Node<IndexNode>(inode, level: 0)
        self.logger = logger
    }
    
    // MARK: Construct the DirTree.
    /**
     Construct the DirTree according the.
     */
    func construct(){
        
        var nextLevel: [Node<IndexNode>] = []
        var currentLevel: [Node<IndexNode>] = [root]
        
        for level in 0..<levelLimit {
            
            // Popup a node from `currentLevel`.
            for node in currentLevel {
                if node.isAtomic() {
                    // Calculate the size for atomic node.
                    // The atomic node is a leaf node.
                    node.calculateLeafNode()
                }
                else {
                    // This is the lowest level.
                    if level == levelLimit-1 {
                        // These nodes in the lowset level is leaf node, and they hava no children.
                        node.calculateLeafNode()
                    } else {
                        // Generate children for this node.
                        node.generateChildren()
                        // Append the children into `nextLevel`.
                        nextLevel.append(contentsOf: node.children)
                    }
                }
            }
            
            // Reset the `currentLevel` to empty.
            currentLevel = []
            
            // Swap `nextLevel` and `currentLevel`.
            (currentLevel, nextLevel) = (nextLevel, currentLevel)
        }
    }
    
    // MARK: Calculate size of each node
    /**
     Calculate the size for each node in this DirTree.
     */
    func calculate() {
        calculateSize(forNode: root)
    }
    
    private func calculateSize(forNode node: Node<IndexNode>) {
        
        let children: [Node<IndexNode>] = node.children
        for child in children {
            calculateSize(forNode: child)
        }
        
        /// The size of leaf node is already calculated in first step: `Dir Tree Construction`.
        if node.isLeaf() {
            return
        } else {
            node.calculateInnerNode()
        }
    }
    
    // MARK: - Print the information.
    func printDirTree() {
        printSubDirTree(root)
    }
    
    private func printSubDirTree(_ node: Node<IndexNode>) {
        
        // First print the node itself.
        printSingleNode(node)
        
        // Then print the children of this node.
        let children = node.children
        for child in children {
            printSubDirTree(child)
        }
    }
    
    private func printSingleNode(_ node: Node<IndexNode>) {
        let indent: String = String(repeating: " ", count: node.level * indentPerLevel)
        let name: String = node.name()
        // Swift.print("\(indent) \(name)")
        
        if let logger = self.logger {
            logger.log("\(indent) \(name)")
        }
    }
    
    private func printStatistics() {
        // x directory, y files
    }
}
