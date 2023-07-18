import UIKit

class Calculator {
    
    let addResult = "+"
    let subtractResult = "-"
    let multiplyResult = "*"
    let divideResult = "/"
    let reminderResult = "%"
    
    //static을 사용하지 않을 경우
    func calculate(sign: String, firstNumber: Double, secondNumber: Double) -> Double {
        var result: Double = 0.0
        let add = AddOperation2()
        let subtract = SubtractOperation2()
        let multiply = MultiplyOperation2()
        let divide = DivideOperation2()
        
        switch sign {
        case addResult :
            result = add.operate(firstNumber: firstNumber, secondNumber: secondNumber)
        case subtractResult :
            result = subtract.operate(firstNumber: firstNumber, secondNumber: secondNumber)
        case multiplyResult :
            result = multiply.perate(firstNumber: firstNumber, secondNumber: secondNumber)
        case divideResult :
            guard secondNumber != 0 else {
                print("ERROR")
                return 0
            }
            result = divide.operate(firstNumber: firstNumber, secondNumber: secondNumber)
        default:
            print("연산자를 다시 확인해주세요")
        }
        return result
    }
}

let calculator = Calculator()
let result = calculator.calculate(sign: "+", firstNumber: 10, secondNumber: 5)
print("RESULT = \(result)")

//static 사용 X
class AddOperation2 {
    func operate(firstNumber: Double, secondNumber: Double) -> Double {
        
        return firstNumber + secondNumber
    }
}

class SubtractOperation2 {
    func operate(firstNumber: Double , secondNumber: Double) -> Double {
        
        return firstNumber - secondNumber
    }
}

class MultiplyOperation2 {
    func perate(firstNumber: Double , secondNumber: Double) -> Double {
        
        return firstNumber * secondNumber
    }
}

class DivideOperation2 {
    func operate(firstNumber: Double , secondNumber: Double ) -> Double {
        
        return firstNumber / secondNumber
    }
}
