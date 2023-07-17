import UIKit

class Calculator {
    func calculate(sign: String, firstNumber: Double, secondNumber: Double) -> Double {
        
        var result: Double = 0.0
        let addResult = "+"
        let subtractResult = "-"
        let multiplyResult = "*"
        let divideResult = "/"
        let reminderResult = "%"
        
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
let result = calculator.calculate(sign: "%", firstNumber: 10, secondNumber: 3.0)

print("RESULT = \(result)")

