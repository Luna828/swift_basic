import Foundation

class Hotel {
    var bankService = BankService()
    var hotelService = HotelService()

    func Center(){
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
                bankService.initMyTotalMoney()
            case 2 :
                hotelService.showRoomList()
            case 9 :
                bankService.totalAccount()
            case 0 :
                print("종료됩니다")
                exit(0)
            default:
                print("다시 선택해주세요")
                continue
            } //switch
        } // calculating
    } // callCenter
}
    


Hotel().Center()
