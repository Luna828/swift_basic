import Foundation

struct HotelService {
    
    var roomList: [RoomInformation] = [
        RoomInformation(roomId: 1, roomPrice: 100000),
        RoomInformation(roomId: 2, roomPrice: 200000),
        RoomInformation(roomId: 3, roomPrice: 300000),
        RoomInformation(roomId: 4, roomPrice: 400000),
        RoomInformation(roomId: 5, roomPrice: 500000),
    ]
    
    func showRoomList(){
        for list in roomList {
            print("\(list.roomId)번방 1박 \(list.roomPrice)원")
        }
    }
}
