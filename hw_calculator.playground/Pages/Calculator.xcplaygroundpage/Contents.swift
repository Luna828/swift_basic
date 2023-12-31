import UIKit

class Calculator {
    
    let addResult = "+"
    let subtractResult = "-"
    let multiplyResult = "*"
    let divideResult = "/"
    let reminderResult = "%"
    
    //Lv1,2
    func calculate1(sign: String, firstNumber: Double, secondNumber: Double) -> Double {
        var result: Double = 0.0
        
        switch sign {
        case addResult :
            result = firstNumber + secondNumber
        case subtractResult :
            result = firstNumber - secondNumber
        case multiplyResult :
            result = firstNumber * secondNumber
        case divideResult :
            guard secondNumber != 0 else {
                print("ERROR")
                return 0
            }
            result = firstNumber / secondNumber
//            if secondNumber == 0 {
//                print("ERROR")
//            } else {
//                result = firstNumber / secondNumber
//            }
        case reminderResult :
            result = firstNumber.truncatingRemainder(dividingBy: secondNumber)
        default:
            print("연산자를 다시 확인해주세요")
        }
        return result
    }
}

let calculator = Calculator()
let result1 = calculator.calculate1(sign: "+", firstNumber: 3, secondNumber: 1)
let result2 = calculator.calculate1(sign: "-", firstNumber: 1, secondNumber: 3)
let result3 = calculator.calculate1(sign: "*", firstNumber: 3, secondNumber: 1)
let result4 = calculator.calculate1(sign: "/", firstNumber: 3, secondNumber: 1)
let result5 = calculator.calculate1(sign: "%", firstNumber: 3, secondNumber: 1)
print("RESULT1 : \(result1)")
print("RESULT2 : \(result2)")
print("RESULT3 : \(result3)")
print("RESULT4 : \(result4)")
print("RESULT5 : \(result5)")
