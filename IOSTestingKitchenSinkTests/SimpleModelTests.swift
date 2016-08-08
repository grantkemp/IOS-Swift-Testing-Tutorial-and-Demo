//
//  SimpleFuncTests.swift
//  IOSTestingKitchenSink
//
//  Created by Grant Kemp on 09/10/2015.
//  Copyright © 2015 Grant Kemp. All rights reserved.
//

// Step 0: Before you start make sure your test file has imported XCTest and has imported the project files so it has access.
import XCTest

@testable import IOSTestingKitchenSink // use the Main Project Folder name
class SimpleModelTests: XCTestCase {
    
    //Start from This awesome Tutorial: http://natashatherobot.com/swift-2-xcode-7-unit-testing-access/
    // The Best way to write these tests  is using the Split Pane view with your test model on the left and the class you are testing on the right pane
    
    //I like to preface the method I am testing with "test" so its easy to see whats being tested
    
    // Step 1: Add the class you are testing as a global variable so that it can be created new in the "Setup Method" and set to nil in the tearDown Method. We call the class "sut" which stands for "Subject Under Test". Use the same variable name for all tests so you don't have to remember what you called your test class and it can be consistent.
    
    var sut: SimpleModel! // Use exclamation as the sut variable will always exists when its being used. 
    
    // Step 2: Create your initialiser for your class when the test starts.
    override func setUp() {
        sut = SimpleModel()
    }
    // Step 3: Unset your global variable so you are testing from fresh with each test. 
    
    override func tearDown() {
        sut = nil
    }
    //TESTING A BOOL
    //Step 4: Start your firts test for the first method in SimpleModel.swift.
    func testSimpleFunctoReturnTrue() {
        
        //We expect that this function should always return true.  We can write the test this way.
        //Step 5: press the diamond on the left to run the test.
        
        XCTAssert(sut.simpleFunctoReturnTrue() == true) // This will pass if the Simple Model file hasn't changed
        
       // XCTAssert(sut.simpleFunctoReturnTrue() == false) // This will fail but I don't like failing tests so I have commented it out.
        

    }
    //TESTING AN INTEGER AND MOCKING
    func testSimpleStringLength() {
        // STEP 6: Lets try testing Integers. The "SimpleStringLength" Method should return the lengtht of the String that we give it. To make sure it works correctly we are going to "Mock up" a test string which we can use to validate. 
        let stringToTest = "LoveTesting"
        
        //STEP 7: 
        XCTAssert(sut.simpleStringLenth(stringToTest) == 11)
        
        //We can also write this test like this: 
        XCTAssertEqual(sut.simpleStringLenth(stringToTest), 11)
        
        
    
        
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
    
    //TEST DRIVEN DEVELOPMENT
    //TESTING A STRING OUTPUT MATCHES WHAT IS EXPECTED
    // I expect that the function I built called sayHelloWorld() will return a string "Hello World".  Before I write my method I start by writing my test about what I expect. Since I haven't written the method yet, I should only write enough to make the the project compile so I go over to my simple Model class and create a blank HelloWorld function.
    
    //eg: func sayHellowWorld()-> String {return String() }
    
    //I should then have a failing test as the function doesn't return Hello World which is what I expected it to return. So I go off and update the method to then return Hello World
    //eg: func sayHellowWorld()-> String {return "Hello World" }
    
    // I then have  passing test when I run tests using CMD+ U or run Product -> Test
    
    func testHelloWorld() {
        let helloworld:String = sut.sayHelloWorld()
        XCTAssertEqual(helloworld, "Hello World")
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
