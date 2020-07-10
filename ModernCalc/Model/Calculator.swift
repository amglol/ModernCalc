//
//  Calculator.swift
//  ModernCalc
//
//  Created by Adrian Galecki on 7/7/20.
//  Copyright © 2020 Adrian Galecki. All rights reserved.
//

import Foundation

enum Operators {
    case add, subtract, divide, multiply
}

class Calculator {
    var sum: Double
    var storeCurrentEquation = [String]()
    
    init(sum: Double, mathSign: String) {
        self.sum = sum
    }
    
    //get the math equation sign and the two numbers that are to be calculated together
    func HandleMathEquation(mathSign sign: Operators, firstNumber: Double?, secondNumber: Double?) {
        guard let num1 = firstNumber, let num2 = secondNumber else { return }
        var result = 0.0
        
        //determine which equation to use
        switch sign {
        case .add:
            result = num1 + num2
            RoundTheResultAndAssignToSum(passInRoundedNumResult: result)
            break
        case .subtract:
            result = num1 - num2
            RoundTheResultAndAssignToSum(passInRoundedNumResult: result)
            break
        case .multiply:
            result = num1 * num2
            RoundTheResultAndAssignToSum(passInRoundedNumResult: result)
            break
        case .divide:
            result = num1 / num2
            RoundTheResultAndAssignToSum(passInRoundedNumResult: result)
            break
        }
    }
    
    //round the result of the calculation and pass to the sum variable
    func RoundTheResultAndAssignToSum(passInRoundedNumResult result: Double) {
        sum = round(1000 * result) / 1000
    }
}
