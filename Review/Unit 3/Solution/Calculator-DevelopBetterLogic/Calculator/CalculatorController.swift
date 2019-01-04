//
//  CalculatorController.swift
//  Calculator
//
//  Created by Jake Hardy on 2/19/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import Foundation
import UIKit



class CalculatorController {
    
    // MARK: - Properties
    
    private var stack = [Double]()
    private var currentInput = ""
    private var currentOutput = ""
    
    // MARK: - Receive Button Functions
    
    func numberReceived(input: String) -> String {
        currentInput += input
        return String(currentInput)
    }
    
    func operationReceived(input: String) {
        if stack.count >= 2 {
            currentInput = input
        }
    }
    
    func enterPressed() -> String? {
        switch currentInput {
        case "/", "x", "+", "-":
            let output = checkState()
            return output
        case "":
            // Invalid Input
            return nil
        default:
            guard let number = Double(currentInput) else { return nil }
            stack.append(number)
            let output = currentInput
            currentInput = ""
            return output
        }
    }
    
    // MARK: - Button & Math Logic Functions
    
    // Function Checks For A Valid State For Operation To Be Carried Out Then Calls For Operation And Resets Input State
    private func checkState() -> String {
        if stack.count >= 2 {
            switch currentInput {
            case "/":
                currentInput = ""
                return divide()
                
            case "x":
                currentInput = ""
                return multiply()
                
            case "+":
                currentInput = ""
                return add()
                
            case "-":
                currentInput = ""
                return subtract()
                
            default:
                return ""
                
            }
        }
        currentInput = ""
        stack.removeAll()
        return "Enter Number"
    }
    
    
    // Functions Implement Math And Return A String
    private func divide() -> String {
        let numbers = operation()
        let number = numbers.numberOne / numbers.numberTwo
        stack.append(number)
        return String(number)
    }
    
    private func multiply() -> String {
        let numbers = operation()
        let number = numbers.numberOne * numbers.numberTwo
        stack.append(number)
        return String(number)
    }
    
    
    private func add() -> String {
        let numbers = operation()
        let number = numbers.numberOne + numbers.numberTwo
        stack.append(number)
        return String(number)
        
    }
    
    private func subtract() -> String {
        let numbers = operation()
        let number = numbers.numberOne - numbers.numberTwo
        stack.append(number)
        return String(number)
    }
    
    // Force Unwrapping - SHOULD ONLY BE CALLED WHEN PREFACED BY A CHECK ON THE STACK
    private func operation() -> (numberOne: Double, numberTwo: Double) {
        let secondNumber = stack.popLast()!
        let firstNumber = stack.popLast()!
        
        return (firstNumber, secondNumber)
    }
    
}