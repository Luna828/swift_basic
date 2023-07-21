import Foundation

protocol AbstractOperation {
    // 연산을 수행하는 함수 작성
    func operate(first: Double, second: Double) -> Double
}

class AddOperation: AbstractOperation {
    func operate(first: Double, second: Double) -> Double {
        return first + second
    }
}

class SubtractOperation: AbstractOperation {
    func operate(first: Double, second: Double) -> Double {
        return first - second
    }
}

class MultiplyOperation: AbstractOperation {
    func operate(first: Double, second: Double) -> Double {
        return first * second
    }
}
class DivideOperation: AbstractOperation {
    func operate(first: Double, second: Double) -> Double {
        return first / second
    }
}

class Calculator {
    
    let addResult = "+"
    let subtractResult = "-"
    let multiplyResult = "*"
    let divideResult = "/"
    
    func calculate(sign: String, firstNumber: Double, secondNumber: Double) -> Double {
        
        var result: Double = 0.0
        
        let add = AddOperation()
        let subtract = SubtractOperation()
        let multiply = MultiplyOperation()
        let divide = DivideOperation()
        
        switch sign {
        case addResult :
            result =  add.operate(first: firstNumber, second: secondNumber)
        case subtractResult :
            result = subtract.operate(first: firstNumber, second: secondNumber)
        case multiplyResult :
            result = multiply.operate(first: firstNumber, second: secondNumber)
        case divideResult :
            result = divide.operate(first: firstNumber, second: secondNumber)
        default :
            guard secondNumber != 0 else {
                print("ERROR")
                return 0
            }
            print("연산자를 다시 확인해주세요")
        }
        return result
    }
}

let cal = Calculator()
cal.calculate(sign: "+", firstNumber: 3, secondNumber: 3)
cal.calculate(sign: "-", firstNumber: 3, secondNumber: 3)
cal.calculate(sign: "*", firstNumber: 3, secondNumber: 3)
cal.calculate(sign: "/", firstNumber: 3, secondNumber: 3)
