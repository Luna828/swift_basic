import Foundation

class Account {
    let id: Int
    let reasonType: String // 이유
    let type : String // 입금 출금
    
    init(id: Int, reasonType: String, type: String) {
        self.id = id
        self.reasonType = reasonType
        self.type = type
    }
}
