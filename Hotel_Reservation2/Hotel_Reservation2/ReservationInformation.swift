import Foundation

class ReservationInformation {
    let id: Int //예약 번호
    let checkInDate: String
    let checkOutDate: String
    
    init(id: Int, checkInDate: String, checkOutDate: String) {
        self.id = id
        self.checkInDate = checkInDate
        self.checkOutDate = checkOutDate
    }
}
