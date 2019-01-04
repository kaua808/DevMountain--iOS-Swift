//
//  FlashlightTests.swift
//  FlashlightTests
//
//  Created by Caleb Hicks on 9/23/15.
//  Copyright © 2015 DevMountain. All rights reserved.
//

import XCTest
@testable import Flashlight

class FlashlightTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testToggle() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        
        guard let viewController = UIStoryboard(name: "Main", bundle: nil).instantiateInitialViewController() as? ViewController else {
            XCTAssert(false, "Expected initial view controller to be ViewController class.")
            return
        }
        
        // Following line forces the view from Storyboard to load UI elements to make available for testing
        
        _ = viewController.view
        
        viewController.viewDidLoad()
        
        if viewController.isOn {
            XCTAssert(false, "Expected flashlight to be off by default.")
        }
        
        viewController.buttonTapped(self)
        
        let stateAfterOneToggle = checkStateForVC(viewController)
        
        viewController.buttonTapped(self)
        
        let stateAfterSecondToggle = checkStateForVC(viewController)
        
        if !stateAfterOneToggle || !stateAfterSecondToggle {
            XCTAssert(false, "ViewController does not match expected state.")
        }

    }
    
    func checkStateForVC(vc: ViewController) -> Bool {
        
        var pass: Bool
        
        if vc.isOn && vc.view.backgroundColor == UIColor.whiteColor() && vc.button.titleLabel?.text == "Off" {
            pass = true
        } else if !vc.isOn && vc.view.backgroundColor == UIColor.blackColor() && vc.button.titleLabel?.text == "On" {
            pass = true
        } else {
            pass = false
        }
        
        return pass
    }
    
}
