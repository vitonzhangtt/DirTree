import Foundation

struct Configuration {
    
    let logFile: String?
    
    init(_ logFile: String? = nil) {
        self.logFile = logFile
    }
}


