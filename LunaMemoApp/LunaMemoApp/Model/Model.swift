//
//  Model.swift
//  LunaMemoApp
//
//  Created by t2023-m0050 on 2023/08/01.
//

import Foundation

class Memo {
    var content: String
    var date: Date
    
    init(content: String) {
        self.content = content
        date = Date()
    }
    
    static var dummyMemoList = [
        Memo(content: "은행 예금하기"),
        Memo(content: "낮잠 자야함 (엄근진)")
    ]
}

class Folder {
    var content: String
    
    init(content: String) {
        self.content = content
    }
    
    static var dummyFolderList = [
        Folder(content: "iCloud"),
        Folder(content: "메모")
    ]
}


