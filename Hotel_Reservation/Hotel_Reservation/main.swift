import Foundation

class HotelReservation {
    
    var totalMoney = 0
    var myMoney: [Int] = []
    
    var hotelList = [
        "1번방 1박 100000원",
        "2번방 1박 200000원",
        "3번방 1박 300000원",
        "4번방 1박 400000원",
        "5번방 1박 500000원"
    ]
    
    var list: [[String:String]] = [
        ["name":"1번방","date":"1박","price":"100000원"],
        ["name":"2번방","date":"1박","price":"200000원"],
        ["name":"3번방","date":"1박","price":"300000원"],
        ["name":"4번방","date":"1박","price":"400000원"]
    ]
    
    let hotel = Hotel(name: "1번방", date: "1박", price: "10000원")
    let hotel2 = Hotel(name: "1번방", date: "1박", price: "10000원")
    let hotel3 = Hotel(name: "1번방", date: "1박", price: "10000원")
    let hotel4 = Hotel(name: "1번방", date: "1박", price: "10000원")
    let hotel5 = Hotel(name: "1번방", date: "1박", price: "10000원")
    
    
    
    func callCenter() {

        print("----------------------------------")
        print("1. 랜덤 금액 지급")
        print("2. 호텔 객실 정보 보기")
        print("3. 호텔 객실 예약하기")
        print("4. 나의 예약 목록 보기")
        print("5. 나의 예약 목록 체크인 날짜 순으로 보기")
        print("6. 예약 삭제하기")
        print("7. 예약 수정하기")
        print("8. 나의 입출금 내역 출력하기")
        print("9. 나의 잔액 보기")
        print("0. 프로그램 종료하기")
        print("-----------------------------------")
        
        var calculating = true
        
        while calculating {
            
            print("원하시는 기능의 번호를 입력해 주세요")
            guard let chooseNumStr = readLine(),
                  let num = Int(chooseNumStr) else {
                print("번호를 잘못 입력하셨습니다")
                return
            }
            
            switch num {
            case 1 :
                var randomNum = Int.random(in: 100000...500000)
                // 생성된 램덤 값에 10000을 나누고 곱하면 뒷 자리의 랜덤 숫자가 다 떨어져 나감
                var randomMoney = (randomNum / 10000) * 10000
                myMoney.append(randomMoney)
                totalMoney  += randomMoney
                print("\(randomMoney)가 입금되었습니다.")
            case 2 :
                print("아시는분.. 아 귀찮아")
            case 9 :
                print("통장에 있는 총 금액은 \(totalMoney)원 입니다")
            case 0 :
                print("종료됩니다")
                calculating = false
                continue
            default:
                print("다시 선택해주세요")
                continue
            } //switch
            
        } // calculating
        
    } // callCenter
    
} //HotelReservation

class Hotel {
    let name : String
    let date : String
    let price : String
    
    init(name: String, date: String, price: String) {
        self.name = name
        self.date = date
        self.price = price
    }
}

let call = HotelReservation()
print(call.callCenter())

