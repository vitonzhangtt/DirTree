//
//  File.swift
//  
//
//  Created by zhangchong on 2021/9/18.
//

import Foundation

class File {
    
    let path: String
    lazy var name: String = {
        let url = URL(fileURLWithPath: path)
        let lastComponent = url.lastPathComponent
        return lastComponent
    }()
    
    init(path: String) {
        self.path = path
    }
}
