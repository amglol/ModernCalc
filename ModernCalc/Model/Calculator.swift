//
//  Calculator.swift
//  ModernCalc
//
//  Created by Adrian Galecki on 7/7/20.
//  Copyright © 2020 Adrian Galecki. All rights reserved.
//

import Foundation

enum Operators {
    case add, subtract, divide, multiply, error
}

struct Calculator {
    
    var sum: Double = 0.0
    
    //get the math equation sign and the two numbers that are to be calculated together
    mutating func HandleMathEquation(mathSign sign: Operators, firstNumber: Double?, secondNumber: Double?) {
        //determine which equation to use
        switch sign{
        case .add:
            if let num1 = firstNumber, let num2 = secondNumber {
                print("\(num1) and \(num2)")
                Add(passInFirstNum: num1, passInSecondNum: num2)
            }
            break
        case .subtract:
            Subtract()
            break
        case .multiply:
            Multiply()
            break
        case .divide:
            Divide()
            break
        case .error:
            ErrorWithCalc()
            break
        }
    }
    
    mutating func Add(passInFirstNum firstNumber: Double, passInSecondNum secondNumber: Double) {
        sum = firstNumber + secondNumber
        print("in the add func SUM = \(sum)")
    }
    
    func Subtract() {
        print("in the subtract func")
    }
    
    func Multiply() {
        print("in the multiply func")
    }
    
    func Divide() {
        print("in the divide func")
    }
    
    func ErrorWithCalc() {
        
    }
}

extension String {
    
}
