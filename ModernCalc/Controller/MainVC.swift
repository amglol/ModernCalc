//
//  ViewController.swift
//  ModernCalc
//
//  Created by Adrian Galecki on 7/7/20.
//  Copyright © 2020 Adrian Galecki. All rights reserved.
//

import UIKit

class MainVC: UIViewController {

    //Outlet
    @IBOutlet weak var currentNumberTypedLbl: UILabel!
    @IBOutlet weak var currentEquationLbl: UILabel!
    
    //variables
    var currentNumber: String = ""
    var equationSign: String = ""
    var currentEquation: String = ""
    var mathSign: String = ""
    var finalSum: Double = 0.0
    
    //initializers
    var currentOperator: Operators!
    var calculator: Calculator!
    var getMathInfo: CalcHelper!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        calculator = Calculator(sum: finalSum, mathSign: equationSign)
        getMathInfo = CalcHelper(currentNum: currentNumber)
    }
    
    @IBAction func calcButtonTapped(_ sender: UIButton) {
        switch sender.tag {
        case 1: //number 1
            currentNumber = getMathInfo.AppendUserEnteredNumber(userEnteredNumber: "1")
            break
        case 2: //number 2
            currentNumber = getMathInfo.AppendUserEnteredNumber(userEnteredNumber: "2")
            break
        case 3: //number 3
            currentNumber = getMathInfo.AppendUserEnteredNumber(userEnteredNumber: "3")
            break
        case 4: //number 4
            currentNumber = getMathInfo.AppendUserEnteredNumber(userEnteredNumber: "4")
            break
        case 5: //number 5
            currentNumber = getMathInfo.AppendUserEnteredNumber(userEnteredNumber: "5")
            break
        case 6: //number 6
            currentNumber = getMathInfo.AppendUserEnteredNumber(userEnteredNumber: "6")
            break
        case 7: //number 7
            currentNumber = getMathInfo.AppendUserEnteredNumber(userEnteredNumber: "7")
            break
        case 8: //number 8
            currentNumber = getMathInfo.AppendUserEnteredNumber(userEnteredNumber: "8")
            break
        case 9: //number 9
            currentNumber = getMathInfo.AppendUserEnteredNumber(userEnteredNumber: "9")
            break
        case 10: //demical
            currentNumber = getMathInfo.AppendUserEnteredNumber(userEnteredNumber: ".")
            break
        case 11: //number 0
            currentNumber = getMathInfo.AppendUserEnteredNumber(userEnteredNumber: "0")
            break
        case 12: //number 00
            if currentNumber == "" {
                break
            }
            else {
                currentNumber = getMathInfo.AppendUserEnteredNumber(userEnteredNumber: "00")
            }
            break
        case 13: // = sign
            currentNumber = getMathInfo.ClearCurrentNumber()
            EquationHandler()
            break
        case 14: // plus sign
            currentOperator = .add
            AddOperatorSignToEquationArray()
            currentNumber = getMathInfo.ClearCurrentNumber()
            break
        case 15: // minus sign
            currentOperator = .subtract
            AddOperatorSignToEquationArray()
            currentNumber = getMathInfo.ClearCurrentNumber()
            break
        case 16: // multiply sign
            currentOperator = .multiply
            AddOperatorSignToEquationArray()
            currentNumber = getMathInfo.ClearCurrentNumber()
            break
        case 17: // divide sign
            currentOperator = .divide
            AddOperatorSignToEquationArray()
            currentNumber = getMathInfo.ClearCurrentNumber()
            break
        case 18: // percent sign
            currentNumber = getMathInfo.GetPercentFromNumber(enterCurrentNumber: currentNumber)
            break
        case 19: // plus/minus sign
            currentNumber = getMathInfo.ConvertCurrentNumToNegative(enterCurrentNumber: currentNumber)
            break
        case 20: // clear sign
            currentNumber = getMathInfo.ClearCurrentNumber()
            getMathInfo.storedValues.removeAll()
            ClearEquationString()
            break
        default:
            print("unknown")
        }
        currentNumberTypedLbl.text = currentNumber
        currentEquationLbl.text = getMathInfo.currentEquation
    }
    
    func AddOperatorSignToEquationArray() {
        switch currentOperator {
        //assign the current operator sign to the equation variable
        case .add:
            mathSign = " + "
            getMathInfo.currentEquation.append(mathSign)
            break
        case .subtract:
            mathSign = " - "
            getMathInfo.currentEquation.append(mathSign)
            break
        case .multiply:
            mathSign = " * "
            getMathInfo.currentEquation.append(mathSign)
            break
        case .divide:
            mathSign = " / "
            getMathInfo.currentEquation.append(mathSign)
            break
        default:
            break
        }
        if getMathInfo.storedValues.isEmpty && getMathInfo.storedValues.count < 1 {
            //do nothing
            return
        }
        else {
            //remove the previous equation string and append the previous sum to the beginning of it with the new operator sign
            getMathInfo.currentEquation.removeAll()
            getMathInfo.currentEquation.append("\(getMathInfo.storedValues[0])\(mathSign)")
        }
    }
    
    //remove the content of the equation string
    func ClearEquationString() {
        getMathInfo.currentEquation.removeAll()
    }
    
    //verify the inputs are valid numbers and pass off for calculation
    func EquationHandler() {
        let canProceedToEquation = CheckIfStoredValuesIsEmpty()
        
        //ensure that there are 2 numbers that can be calculating against
        if !canProceedToEquation && getMathInfo.storedValues.count > 1 {
            let firstNum = getMathInfo.storedValues[0]
            let secondNum = getMathInfo.storedValues[1]
            
            //verify the two variables are valid numbers
            if let firstNum1 = Double(firstNum), let secondNum2 = Double(secondNum) {
                
                //pass the numbers and operator for calculation
                calculator.HandleMathEquation(mathSign: currentOperator, firstNumber: firstNum1, secondNumber: secondNum2)
            }
            
            //clear the storedValues array
            getMathInfo.storedValues.removeAll()
            
            //add the sum to the stored values
            getMathInfo.storedValues.append(String(calculator.sum))
            
            //assign the current number to the sum of the two numbers
            currentNumber = String(calculator.sum)
            
        }
        else {
            //reassign the current number to the previous sum
            currentNumber = String(calculator.sum)
        }
        
        //append the sum to the equation string
        getMathInfo.currentEquation.append(" = \(currentNumber)")
        
    }
    
    //check if the stored values array is empty or not
    func CheckIfStoredValuesIsEmpty() -> Bool {
        var isStoredValuesEmpty = false
        
        if getMathInfo.storedValues.isEmpty {
            isStoredValuesEmpty = true
        }
        else {
            isStoredValuesEmpty = false
        }
        
        return isStoredValuesEmpty
    }
}

