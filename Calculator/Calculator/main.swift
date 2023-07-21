import Foundation

class Calculator {
    
    let addResult = "+"
    let subtractResult = "-"
    let multiplyResult = "*"
    let divideResult = "/"
    let reminderResult = "%"
    
    func calculate() {
        
        var continueCalculating = true
        
        while continueCalculating {
            
            print("첫 번째 숫자를 입력하세요:")
            guard let firstNumberString = readLine(),
                  let firstNumber = Double(firstNumberString) else {
                print("유효한 숫자를 입력해주세요.")
                return
            }
            
            print("연산자를 입력하세요 (+, -, *, /):")
            guard let operatorInput = readLine() else {
                print("연산자를 입력해주세요.")
                return
            }
            
            print("두 번째 숫자를 입력하세요:")
            guard let secondNumberString = readLine(),
                  let secondNumber = Double(secondNumberString) else {
                print("유효한 숫자를 입력해주세요.")
                return
            }
            
            let result: Double
            
            switch operatorInput {
            case addResult:
                result = firstNumber + secondNumber
            case subtractResult:
                result = firstNumber - secondNumber
            case multiplyResult:
                result = firstNumber * secondNumber
            case divideResult:
                guard secondNumber != 0 else {
                    print("0으로 나눌 수 없습니다.")
                    return
                }
                result = firstNumber / secondNumber
            default:
                print("유효하지 않은 연산자입니다.")
                continue
            }
            
            print("RESULT : \(result)")
            
            var validInput = false
            
            while !validInput {
                print("계산을 계속하시겠습니까? (y/n):")
                if let continueInput = readLine() {
                    if continueInput == "y" {
                        validInput = true
                        continueCalculating = true
                    } else if continueInput == "n" {
                        validInput = true
                        continueCalculating = false
                    } else {
                        print("유효하지 않음, 다시 입력해주세요")
                    }
                }
            }
            
        }
        print("계산기를 종료합니다")
    }
    
//    func calculate2() {
//        let firstString = readLine()
//        let operatorInput = readLine()
//        let secondString = readLine()
//
//        var result: Double
//
//        result = firstString + operatorInput + secondString
//
//
//
//        print("계산기를 종료합니다")
//    }
}

let cal = Calculator()
cal.calculate()


