import Foundation

class HotelReservation {
    
    var totalMoney = 0
    var myMoney: [Int] = []
    
    var hotelList: [[String:String]] = [
        ["name":"1번방","date":"1박","price":"100000원","체크인":"00-00", "체크아웃":"00-00"],
        ["name":"2번방","date":"1박","price":"200000원","체크인":"00-00", "체크아웃":"00-00"],
        ["name":"3번방","date":"1박","price":"300000원","체크인":"00-00", "체크아웃":"00-00"],
        ["name":"4번방","date":"1박","price":"400000원","체크인":"00-00", "체크아웃":"00-00"],
        ["name":"5번방","date":"1박","price":"500000원","체크인":"00-00", "체크아웃":"00-00"],
    ]
    
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
        
        while true {
            print("원하시는 기능의 번호를 입력해 주세요")
            guard let chooseNumStr = readLine(),
                  let num = Int(chooseNumStr) else {
                print("번호를 잘못 입력하셨습니다")
                return
            }
            
            switch num {
            case 1 :
                randomNum()
            case 2 :
                hotelInfo()
            case 9 :
                print("통장에 있는 총 금액은 \(totalMoney)원 입니다")
            case 0 :
                print("종료됩니다")
                exit(0)
            default:
                print("다시 선택해주세요")
                continue
            } //switch
            
        } // calculating
        
        //1번문제
        func randomNum(){
            var randomNum = Int.random(in: 100000...500000)
            // 생성된 램덤 값에 10000을 나누고 곱하면 뒷 자리의 랜덤 숫자가 다 떨어져 나감
            var randomMoney = (randomNum / 10000) * 10000
            totalMoney  += randomMoney
            print("\(randomMoney)가 입금되었습니다.")
        }
        
        //2번문제
        func hotelInfo(){
            
            for option in hotelList {
                if let name = option["name"],
                   let date = option["date"],
                   let price = option["price"] {
                    print("\(name) \(date) \(price)")
                }
                
            }
        }
        
        //    func showRoom(){
        //        for i in 1...5 {
        //            print("\(i)번방 1박 \(i)0000원")
        //        }
        //    }
        
    } // callCenter
    
} //HotelReservation

let call = HotelReservation()
print(call.callCenter())

