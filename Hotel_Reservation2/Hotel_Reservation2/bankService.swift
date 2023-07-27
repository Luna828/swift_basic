import Foundation

struct BankService {
    var totalMoney = 0
    var accountList: [Int] = []
    
    mutating func totalAccount(){
        print("통장에 있는 총 금액은 \(totalMoney)원 입니다")
    }
    
    mutating func initMyTotalMoney(){
        let randomNumber = Int.random(in: 10000...500000)
        let randomMoney = (randomNumber / 10000) * 10000
        totalMoney += randomMoney
        
        accountList.append(totalMoney)
        
        print("\(randomMoney)원이 지급되었습니다")
    }
}



