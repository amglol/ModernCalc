//
//  HelperFunctions.swift
//  ModernCalc
//
//  Created by Adrian Galecki on 7/7/20.
//  Copyright © 2020 Adrian Galecki. All rights reserved.
//

import Foundation

struct Calculations {
    var currentNum: String = ""
    var storedValues = [String]()
    
    //append user entered numbers together
    mutating func AppendUserEnteredNumbers(userEnteredNumber number: String) -> String {
        
        let numberCount = CurrentNumberCount(currentNumberStringSequence: currentNum)
        
        if let numberCount = numberCount {
            if numberCount <= 9 {
                currentNum.append(number)
            }
        }
        return currentNum
    }

    //keep track of the currentNumber count
    func CurrentNumberCount(currentNumberStringSequence number: String) -> Int? {
        let count = number.count
        
        guard count >= 1 else { return 0 }
        
        return count
    }
    
    mutating func ClearCurrentNumber() -> String {
        print("Adding \(currentNum) to array")
        //append to stored values
        storedValues.append(currentNum)
        print(storedValues)
        print("StoredValues count = \(storedValues.count)")
        currentNum = ""
        
        for values in storedValues {
            print(values)
        }
        
        return currentNum
    }
}




