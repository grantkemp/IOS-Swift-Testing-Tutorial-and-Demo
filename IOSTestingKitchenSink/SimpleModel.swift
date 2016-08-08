//
//  SimpleFunc.swift
//  IOSTestingKitchenSink
//
//  Created by Grant Kemp on 09/10/2015.
//  Copyright © 2015 Grant Kemp. All rights reserved.
//

import Foundation

class SimpleModel {
    
    //Based on this Awesome Tutorial : http://natashatherobot.com/swift-2-xcode-7-unit-testing-access/
    
    func simpleFunctoReturnTrue() -> Bool {
        
        
        return true
    }
   
    func simpleStringLenth(stringToTest:String) -> Int {
        
        let stringLength = stringToTest.characters.count
        return stringLength
    }
    
    func sayHelloWorld() -> String {
        
        return "Hello World"
    }

    
    
    
    
    }