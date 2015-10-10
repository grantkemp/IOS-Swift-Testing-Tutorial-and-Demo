//
//  LessonsConstants.swift
//  IOSTestingKitchenSink
//
//  Created by Grant Kemp on 07/09/2015.
//  Copyright (c) 2015 Grant Kemp. All rights reserved.
//

import Foundation

class LessonsConstants {
    
        
    // MARK: - Shared Instance
    
    class func sharedInstance() -> LessonsConstants {
        
        struct Singleton {
            static var sharedInstance = LessonsConstants()
        }
        
        return Singleton.sharedInstance
    }
}

    
