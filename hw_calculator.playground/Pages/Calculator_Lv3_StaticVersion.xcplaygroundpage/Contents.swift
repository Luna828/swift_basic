import UIKit

class Calculator {
    
    let addResult = "+"
    let subtractResult = "-"
    let multiplyResult = "*"
    let divideResult = "/"
    let reminderResult = "%"
    
    //Lv3 - 방법 1 class들을 정적 메서드로
    // 클래스 내부의 메서드를 정적으로 선언하면 해당 메서드는 클래스 자체에 속합니다
    // 그러므로 특정 인스턴스에 연결되지 않고 자체에 연결이 되어있으므로, 인스턴스를 생성하지 않고도 호출 가능!!
    func calculate(sign: String, firstNumber: Double, secondNumber: Double) -> Double {
        var result: Double = 0.0
        
        switch sign {
        case addResult :
            result = AddOperation.operate(firstNumber: firstNumber, secondNumber: secondNumber)
        case subtractResult :
            result = SubtractOperation.operate(firstNumber: firstNumber, secondNumber: secondNumber)
        case multiplyResult :
            result = MultiplyOperation.perate(firstNumber: firstNumber, secondNumber: secondNumber)
        case divideResult :
            guard secondNumber != 0 else {
                print("ERROR")
                return 0
            }
            result = DivideOperation.operate(firstNumber: firstNumber, secondNumber: secondNumber)
        default:
            print("연산자를 다시 확인해주세요")
        }
        return result
    }
}

let calculator = Calculator()
let result3 = calculator.calculate(sign: "+", firstNumber: 10, secondNumber: 5)
print("RESULT = \(result3)")

//1번 기능
//static 정적 메서드를 사용
class AddOperation {
    static func operate(firstNumber: Double, secondNumber: Double) -> Double {
        
        return firstNumber + secondNumber
    }
}

class SubtractOperation {
    static func operate(firstNumber: Double , secondNumber: Double) -> Double {
        
        return firstNumber - secondNumber
    }
}

class MultiplyOperation {
    static func perate(firstNumber: Double , secondNumber: Double) -> Double {
        
        return firstNumber * secondNumber
    }
}

class DivideOperation {
    static func operate(firstNumber: Double , secondNumber: Double ) -> Double {
        
        return firstNumber / secondNumber
    }
}
