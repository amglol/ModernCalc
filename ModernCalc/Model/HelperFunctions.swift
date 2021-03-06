//
//  HelperFunctions.swift
//  ModernCalc
//
//  Created by Adrian Galecki on 7/7/20.
//  Copyright © 2020 Adrian Galecki. All rights reserved.
//

import Foundation

class CalcHelper {
    var currentNum: String
    var storedValues = [String]()
    var currentEquation: String = ""
    
    init(currentNum: String) {
        self.currentNum = currentNum
    }
    
    //add the next value to current num
    func AppendUserEnteredNumber(userEnteredNumber number: String) -> String {
        //limit the input to 9 max
        if currentNum.count <= 9 {
            currentNum.append(number)
            currentEquation.append(number)
            print("current equation from AppendUserInput = \(currentEquation)")
        }
        
        return currentNum
    }

    //clears the current number variable
    func ClearCurrentNumber() -> String {
        if currentNum != "" {
            //append to stored values
            storedValues.append(currentNum)
            print("current present currentNum that was added = \(storedValues)")
        }
        
        //clear the current num so that the next set can be stored
        currentNum = ""

        return currentNum
    }
    
    //get the percent value of the current number
    func GetPercentFromNumber(enterCurrentNumber number: String) -> String {
        //ensure that the current num (string) is a number
        if let number = Double(number) {
            //do the math
            let percent = number / 100
            print("Percent = \(percent)")
            
            if storedValues.isEmpty {
                //reassign the current num string with the percent value
                currentNum = String(percent)
                print("currentNum = \(currentNum)")

                currentEquation = "\(currentNum)%"
            }
            else {
                if let currentNumber = Double(storedValues[0]) {
                    print("current number is = \(currentNumber)")
                    let combinedNum = currentNumber * percent
                    print("combined number is = \(combinedNum)")

                     currentNum = String(combinedNum)
                    currentEquation = "\(currentNum)%"
                }
            }
            print(storedValues)
        }
        return currentNum
    }
    
    //convert and get the negative number of the current number
    func ConvertCurrentNumToNegative(enterCurrentNumber number: String) -> String {
        if let number = Double(number) {
            let negativeNum = number * -1
            
            //reassign the currentNum with a negative number
            currentNum = String(negativeNum)
            print("current num in negative func = \(currentNum)")
            
            currentEquation = currentNum
        }
        return currentNum
    }
}




