//
//  ViewController.swift
//  ModernCalc
//
//  Created by Adrian Galecki on 7/7/20.
//  Copyright © 2020 Adrian Galecki. All rights reserved.
//

import UIKit

class MainVC: UIViewController {

    @IBOutlet weak var currentNumberTypedLbl: UILabel!
    var currentNumber: String = ""
    var currentOperator = Operators.error
    var getMathInfo = Calculations()
    var calculator = Calculator()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func calcButtonTapped(_ sender: UIButton) {
        switch sender.tag {
        case 1: //number 1
            currentNumber = getMathInfo.AppendUserEnteredNumbers(userEnteredNumber: "1")
            break
        case 2: //number 2
            currentNumber = getMathInfo.AppendUserEnteredNumbers(userEnteredNumber: "2")
            break
        case 3: //number 3
            currentNumber = getMathInfo.AppendUserEnteredNumbers(userEnteredNumber: "3")
            break
        case 4: //number 4
            currentNumber = getMathInfo.AppendUserEnteredNumbers(userEnteredNumber: "4")
            break
        case 5: //number 5
            currentNumber = getMathInfo.AppendUserEnteredNumbers(userEnteredNumber: "5")
            break
        case 6: //number 6
            currentNumber = getMathInfo.AppendUserEnteredNumbers(userEnteredNumber: "6")
            break
        case 7: //number 7
            currentNumber = getMathInfo.AppendUserEnteredNumbers(userEnteredNumber: "7")
            break
        case 8: //number 8
            currentNumber = getMathInfo.AppendUserEnteredNumbers(userEnteredNumber: "8")
            break
        case 9: //number 9
            currentNumber = getMathInfo.AppendUserEnteredNumbers(userEnteredNumber: "9")
            break
        case 10: //demical
            currentNumber = getMathInfo.AppendUserEnteredNumbers(userEnteredNumber: ".")
            break
        case 11: //number 0
            currentNumber = getMathInfo.AppendUserEnteredNumbers(userEnteredNumber: "0")
            break
        case 12: //number 00
            if currentNumber == "" {
                break
            }
            else {
                currentNumber = getMathInfo.AppendUserEnteredNumbers(userEnteredNumber: "00")
            }
            break
        case 13: // = sign
            currentNumber = getMathInfo.ClearCurrentNumber()
            EquationHandler()
            break
        case 14: // plus sign
            currentOperator = .add
            currentNumber = getMathInfo.ClearCurrentNumber()
            break
        case 15: // minus sign
            currentOperator = .subtract
            break
        case 16: // multiply sign
            currentOperator = .multiply
            break
        case 17: // divide sign
            currentOperator = .divide
            break
        case 18: // percent sign
            
            break
        case 19: // plus/minus sign
            break
        case 20: // clear sign
            currentNumber = getMathInfo.ClearCurrentNumber()
            getMathInfo.storedValues.removeAll()
            break
        default:
            print("unknown")
        }
        
        currentNumberTypedLbl.text = currentNumber
    }
    
    func EquationHandler() {
        let firstNum = getMathInfo.storedValues[0]
        let secondNum = getMathInfo.storedValues[1]
        
        if let firstNum1 = Double(firstNum), let secondNum2 = Double(secondNum) {
            calculator.HandleMathEquation(mathSign: currentOperator, firstNumber: firstNum1, secondNumber: secondNum2)
        }
        
//        //clear the storedValues array
//        getMathInfo.storedValues.removeAll()
    }
}

