import Foundation

class RoomInfo { //2번 클릭 시 객실 정보 보기
    let num : String // 1
    let roomName : String // 1번방
    let price : Int //가격
    
    init(num: String, roomName: String, price: Int) {
        self.num = num
        self.roomName = roomName
        self.price = price
    }
}


struct ReservationInfo { //예약한 목록
    var num : String //1
    let roomName : String
    var checkInDate : String //체크인
    var checkOutDate : String //체크아웃
    let nights : Int //몇박며칠 (x2)
    
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
    var fakeDate = 20230701 //입출금 내역
    
    var roomInfo: RoomInfo = RoomInfo(num: "1", roomName: "1번방", price: 100000) //RoomInfo인스턴트 생성
    var reservationInfo: ReservationInfo = ReservationInfo(num: "1",roomName: "1번방",checkIn: "20230701", checkOut: "20230705", nights: 2)
    // ReservationInfo 인스턴트 생성
    
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
    
    var myReservationList : [ReservationInfo] = [] // 나의 예약목록 리스트
    
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
                continue
            }
            
            switch num {
            case 1 :
                initMyTotalMoney()
            case 2 :
                hotelInfo()
            case 3 :
                roomReservation()
            case 4 :
                myRoomList()
            case 5 :
                myRoomListSort()
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


    //3번문제 -> night(몇박인지): 2박 fix
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
        print("체크인 날짜를 입력하세요 (ex. 2023-07-01)")
        guard let checkIn = readLine() else {
            print("날짜를 입력해주세요")
            return
        }
        print("체크아웃 날짜를 입력하세요 (ex. 2023-07-01)")
        guard let checkOut = readLine() else {
            print("날짜를 입력해주세요")
            return
        }
        if let room = roomList.first(where: {$0.num == num}) {
            let totalPrice = room.price * reservationInfo.nights
            myReservationList.append(ReservationInfo(num: num, roomName: "1번방", checkIn: checkIn, checkOut: checkOut, nights: 2))
            if totalMoney >= totalPrice {
                totalMoney -= totalPrice
                print("예약이 완료되었습니다.")
                print("남은 돈: \(totalMoney)")
            }else {
                print("돈이 부족합니다.")
                myReservationList.removeAll()
                return
            }
            
        }
        
        
    }
    //4번 문제 -> 1박 가격 안나옴..
    func myRoomList() {
        for (index ,myReservationLists) in myReservationList.enumerated() {
                    print("\(index + 1). \(myReservationLists.num)번방, 체크인: \(myReservationLists.checkInDate), 체크아웃: \(myReservationLists.checkOutDate)")
                }
        }
    //5번 문제 -> 1박 가격 안나옴..
    func myRoomListSort() {
        let myReservationLists = myReservationList.sorted(by: {$0.checkInDate < $1.checkInDate})
        for (index ,myReservationList) in myReservationLists.enumerated() {
                    print("\(index + 1). \(myReservationList.num)번방, 체크인: \(myReservationList.checkInDate), 체크아웃: \(myReservationList.checkOutDate)")
                }
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
                let deleteReservationList = myReservationList.remove(at: deleteNum)
                let refund = deleteReservationList.nights * (roomList.first{$0.roomName == deleteReservationList.roomName}?.price ?? 0)
                totalMoney += refund
                bankStateList.append(BankState.init(reasonType: "환불", type: "입금", amount: refund, date: fakeDate))
                print("예약이 취소되었습니다 \(refund)원이 환불되었습니다")
                
            } else {
                print("없는 예약내역입니다")
            }
        }
    }
    
    //7번문제
    func updateReservation(){
        if myReservationList.isEmpty {
            print("예약이 없습니다")
        } else {
            print("예약 목록입니다")
            for (index, reservationList) in myReservationList.enumerated() {
                print("\(index + 1). \(reservationList.roomName) 체크인: \(reservationList.checkInDate) 체크아웃: \(reservationList.checkOutDate)")
            }
            print("변경할 예약 번호를 입력하세요")
            guard let numStr = readLine(),
                  let num = Int(numStr) else {
                print("번호를 입력해주세요")
                return
            }
            
            if num > 0 && num <= myReservationList.count {
                let updateNum = num - 1
                var updateReservationList = myReservationList[updateNum]
                
                print("먼저 호텔 방 목록을 알려드리겠습니다")
                print(hotelInfo)
                print("새로운 방 번호를 입력해주세요")
                guard let roomNum = readLine(),
                      let roomName = roomList.first(where: {$0.num == roomNum})?.roomName else {
                    print("옳은 방 번호를 입력해주세요")
                    return
                }
                
                print("새로운 체크인 날짜를 입력하세요 (2023-07-01)")
                guard let checkInDate = readLine() else {
                    print("날짜를 다시 입력해주세요")
                    return
                }
                
                print("새로운 체크아웃 날짜를 입력하세요 (2023-07-02")
                guard let checkOutDate = readLine() else {
                    print("날짜를 다시 입력해주세요")
                    return
                }
                
                // 아직 코드 작동 에러..
                if let newRoomPrice = roomList.first(where: { $0.roomName == roomName })?.price {
                    let nightsDiff = abs(updateReservationList.nights)
                    let additionalPayment = newRoomPrice * nightsDiff
                    
                    if updateReservationList.nights < 0 { // 추가 결제
                        if additionalPayment <= totalMoney {
                            totalMoney += additionalPayment
                            bankStateList.append(BankState(reasonType: "차액", type: "입금", amount: additionalPayment, date: fakeDate))
                        } else {
                            print("잔액이 부족하여 예약 변경을 완료할 수 없습니다")
                            return
                        }
                    } else if updateReservationList.nights > 0 { // 환불
                        totalMoney -= additionalPayment
                        bankStateList.append(BankState(reasonType: "차액", type: "출금", amount: additionalPayment, date: fakeDate))
                    }
                    
                    updateReservationList.roomName = roomName
                    updateReservationList.checkInDate = checkInDate
                    updateReservationList.checkOutDate = checkOutDate
                    
                    myReservationList[updateNum] = updateReservationList
                        print("\(updateReservationList.roomName) 체크인: \(updateReservationList.checkInDate) 체크아웃: \(updateReservationList.checkOutDate)으로 예약이 변경되었습니다")
                } else {
                    print("유효하지 않은 예약 번호입니다")
                }
            } else {
                print("유효하지 않은 예약 번호입니다")
            }
        }
            
    }
    
    //8번문제
    func showBankStates() {
        if bankStateList.isEmpty {
            print("아무런 잔액이 없습니다")
        } else {
            for bankState in bankStateList {
                print("\(bankState.reasonType)(으)로 \(bankState.amount)원이 \(bankState.type)되었습니다")
            }
        }
    }
} //HotelReservation

let call = HotelReservation()
print(call.callCenter())

