import Foundation

class RoomInformation {
    let roomId: Int //room Id (1번방, 2번방, 3번방...)
    let roomPrice: Int//room price (가격)
    
    init(roomId: Int, roomPrice: Int) {
        self.roomId = roomId
        self.roomPrice = roomPrice
    }
}
