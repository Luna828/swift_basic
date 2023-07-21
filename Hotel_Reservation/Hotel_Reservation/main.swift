import Foundation

class RoomInfo {
    let num : String
    let roomName : String
    let price : Int
    
    init(num: String, roomName: String, price: Int) {
        self.num = num
        self.roomName = roomName
        self.price = price
    }
}

class ReservationInfo {
    let num : String
    let roomName : String
    let checkInDate : String
    let checkOutDate : String
    let nights : Int
    
    init(num: String, roomName: String, checkIn: String, checkOut: String, nights: Int) {
        self.num = num
        self.roomName = roomName
        self.checkInDate = checkIn
        self.checkOutDate = checkOut
        self.nights = nights
    }
}

//입출금 내역
class BankState {
    let reasonType : String // 1.랜덤, 2.예약취소, 3.예약
    let type : String //1:입금, 2:출금
    let amount : Int //입출금 금액
    let date : Int //날짜
    
    init(reasonType: String, type: String, amount: Int, date: Int) {
        self.reasonType = reasonType
        self.type = type
        self.amount = amount
        self.date = date
    }
}

class HotelReservation {
    var fakeDate = 20230701
    
    var totalMoney = 0
    var myMoney: [Int] = []
    var bankStateList: [BankState] = []
    
    var roomList: [RoomInfo] = [
        RoomInfo.init(num: "1", roomName: "1번방", price: 100000),
        RoomInfo.init(num: "2", roomName: "2번방", price: 200000),
        RoomInfo.init(num: "3", roomName: "3번방", price: 300000),
        RoomInfo.init(num: "4", roomName: "4번방", price: 400000),
        RoomInfo.init(num: "5", roomName: "5번방", price: 500000)
    ]
    
    var myReservationList : [ReservationInfo] = []
    
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
                initMyTotalMoney()
            case 2 :
                hotelInfo()
            case 3 :
                roomReservation()
            case 4 :
                for reservationLists in myReservationList {
                    print("\(reservationLists.num) \(reservationLists.checkInDate) \(reservationLists.checkOutDate)")
                }
            case 5 :
                print("")
            case 6 :
                deleteReservation()
            case 7 :
                updateReservation()
            case 8 :
                showBankStates()
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
    } // callCenter
    
    //1번문제
    func initMyTotalMoney(){
        let randomNum = Int.random(in: 100000...500000)
        // 생성된 램덤 값에 10000을 나누고 곱하면 뒷 자리의 랜덤 숫자가 다 떨어져 나감
        let randomMoney = (randomNum / 10000) * 10000
        totalMoney  += randomMoney
        fakeDate += 1
        bankStateList.append(BankState.init(reasonType: "랜덤", type: "입금", amount: randomMoney, date: fakeDate))
        print("\(randomMoney)가 입금되었습니다.")
    }
    
    //2번문제
    func hotelInfo(){
        for roomInfo in roomList {
            let name = roomInfo.roomName
            let price = roomInfo.price
            
            print("\(name) 1박 \(price)원")
        }
    }

    func roomReservation(){
        print("---------------------------------------")
        print("방 번호, 체크인 날짜, 체크아웃 날짜를 각각 입력해주세요")
        print()
        print("---------------------------------------")
        print("방 번호를 입력하세요")
        guard let num = readLine() else {
            print("번호를 입력해주세요")
            return
        }
        
//        if let roomNum = roomList.first(where: {$0.num == num}),
////           let roomName = {$0.name},
////           let roomPrice = {$0.price} {
//
//            print("\(roomName)을 선택하셨습니다")
//            print("체크인 날짜를 입력하세요 (2023-07-01)")
//            guard let checkInDate = readLine() else {
//                print("날짜를 입력하세요")
//                return
//            }
//
//            print("체크 아웃 날짜를 입력하세요 (2023-07-02")
//            guard let checkOutDate = readLine() else {
//                       print("날짜를 입력하세요")
//                       return
//                   }
//
//            myReservationList.append(ReservationInfo.init(num: roomNum, checkIn: checkInDate, checkOut: checkOutDate, nights: 2))
//
//            print("예약이 완료되었습니다")
            
 //       }
    }
    
    //6번문제
    func deleteReservation(){
        
        // 예약 목록이 보여야함!
        if myReservationList.isEmpty {
           print("예약이 없습니다")
        }  else {
            print("예약 목록입니다")
            for (index, reservationList) in myReservationList.enumerated() {
                print("\(index + 1). \(reservationList.roomName) 체크인: \(reservationList.checkInDate) 체크아웃: \(reservationList.checkOutDate)")
            }
            print("취소할 예약 번호를 입력하세요")
            guard let numStr = readLine(),
                  let num = Int(numStr) else {
                print("번호를 입력해주세요")
                return
            }
            
            if num > 0 && num <= myReservationList.count {
                let deleteNum = num - 1 //사람들은 1부터 세고, 컴퓨터의 배열은 0부터 시작함
                let deleteReservation = myReservationList.remove(at: deleteNum)
                print("예약이 취소되었습니다")
            } else {
                print("없는 예약내역입니다")
            }
        }
    }
    
    //7번문제
    func updateReservation(){
        
    }
    
    //8번문제
    func showBankStates() {
        for bankState in bankStateList {
            print("\(bankState.reasonType)(으)로 \(bankState.amount)원이 \(bankState.type)되었습니다")
        }
    }
    
    
} //HotelReservation

let call = HotelReservation()
print(call.callCenter())

