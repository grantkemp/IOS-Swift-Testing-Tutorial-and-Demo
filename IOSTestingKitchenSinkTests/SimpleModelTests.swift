//
//  SimpleFuncTests.swift
//  IOSTestingKitchenSink
//
//  Created by Grant Kemp on 09/10/2015.
//  Copyright © 2015 Grant Kemp. All rights reserved.
//

import XCTest
@testable import IOSTestingKitchenSink // use the Main Project Folder
class SimpleModelTests: XCTestCase {
    
    //FROM This awesome Tutorial: http://natashatherobot.com/swift-2-xcode-7-unit-testing-access/
    
    func testSimpleFunc() {
        let mySimpleModel  = SimpleModel()
        XCTAssert(mySimpleModel.simpleFunc() == true)
    }
 //Now Press the black squares next to your test to run
    
    func testSimpleStringLength() {
        
        let mySimpleModel  = SimpleModel()
        
        let targetLength = 10
        
        let randomString =  randomAlphaNumericString(targetLength)
    
        XCTAssert(mySimpleModel.simpleStringLenth(randomString) == 10)
        
    }
    
    func testIsOneGreater() {
        let MySimpleModel = SimpleModel()
        var testRuns = 0
        var numberOfTestsToRun = 200
        for var i = 0; i <= numberOfTestsToRun; ++i {
            let randomString = randomAlphaNumericString()
            testRuns++
            //Failing Test Below
//            XCTAssertGreaterThanOrEqual(MySimpleModel.simpleStringLenth(randomString), MySimpleModel.simpleStringLenth(randomString)+1) // As String is never going to be larger than or equal to another string that is one larger than it
            
            //Passing Test Below
            XCTAssertLessThan(MySimpleModel.simpleStringLenth(randomString), MySimpleModel.simpleStringLenth(randomString)+1)
        }
       print("Test run \(testRuns) times")
    
    }

    //MARK: Test Helpers
    func randomAlphaNumericString(length: Int = 10) -> String {
        
        let allowedChars = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
        let allowedCharsCount = UInt32(allowedChars.characters.count)
        var randomString = ""
        
        for _ in (0..<length) {
            let randomNum = Int(arc4random_uniform(allowedCharsCount))
            let newCharacter = allowedChars[allowedChars.startIndex.advancedBy(randomNum)]
            randomString += String(newCharacter)
        }
        
        return randomString
}
}
