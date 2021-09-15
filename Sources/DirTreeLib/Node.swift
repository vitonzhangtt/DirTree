//
//  Node.swift
//  
//
//  Created by zhangchong on 2021/8/19.
//

import Foundation

class Node<Element: Devideble>: CustomStringConvertible {
    
    var element: Element
    var children: [Node<Element>]
    private(set) var level: Int
    
    init(_ element: Element, level: Int) {
        self.element = element
        children = []
        self.level = level
    }
    
    /**
     Generate the children for this node from `element`.
     */
    func generateChildren() {
        let subElements: [Element]? = element.elements()
        if let subElements = subElements {
            subElements.forEach { element in
                let childNode = Node(element, level: level+1)
                children.append(childNode)
            }
        }
        else {
            // Assign the `children` to an empty array.
            // The default value for `children` is an empty array.
        }
    }
    
    func calculateLeafNode() {
        if isLeaf() {
            element.run()
        }
    }
    
    func calculateInnerNode () {
        var thisNodeSize: UInt64 = 0
        
        if isLeaf() {
            return
        }
        
        // Firstly calculate the size of each children node.
        for child in children {
            let childTreeSize: UInt64 = child.element.treeSize()
            thisNodeSize = childTreeSize + thisNodeSize
        }
        
        // Secondly calculate the size of this `node` as the sum of children node's size.
        let nodeSize: UInt64 = element.nodeSize()
        thisNodeSize = thisNodeSize + nodeSize
        
        // Finally assign `thisNodeSize` to tree size of this element.
        element.setTreeSize(thisNodeSize)
    }
    
    func addChild(_ child: Node<Element>) -> Void {
        children.append(child)
    }
        
    func name() -> String {
        return element.description
    }
    
    func isAtomic() -> Bool {
        return element.isAtomic()
    }
    
    func isLeaf() -> Bool {
        return children.isEmpty
    }
    
    // MARK: CustomStringConvertible
    public var description: String {
        return name()
    }
}
