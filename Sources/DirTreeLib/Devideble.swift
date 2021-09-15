//
//  Devideble.swift
//  
//
//  Created by zhangchong on 2021/8/19.
//

import Foundation


protocol Devideble: CustomStringConvertible {
    
    /**
     
     */
    func elements() -> [Self]?
    
    /**
     Whether the Devideble object is atomic.
     */
    func isAtomic() -> Bool
    
    /**
     
     */
    func shortName() -> String
    
    /**
     
     */
    func fullName() -> String
    
    /**
     
     */
    func run()
    
    func setTreeSize(_ size: UInt64)
    
    func treeSize() -> UInt64
    
    func nodeSize() -> UInt64
}
