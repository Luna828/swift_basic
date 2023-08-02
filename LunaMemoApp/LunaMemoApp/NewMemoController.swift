//
//  NewMemoController.swift
//  LunaMemoApp
//
//  Created by t2023-m0050 on 2023/08/02.
//

import UIKit

class NewMemoController: UIViewController {
    
    @IBOutlet weak var memoTextView: UITextView!
    
    @IBAction func saveBtn(_ sender: Any) {
        
        guard let memo = memoTextView.text,
              memo.count > 0 else {
            alert(message: "메모를 입력하세요")
            return
        }
        
        let newMemo = Memo(content: memo, date: Date())
        Memo.dummyMemoList.append(newMemo)
        
        NotificationCenter.default.post(name: NewMemoController.newMemoInsert, object: nil)
        
        navigationController?.popViewController(animated: true)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
}

extension NewMemoController {
    static let newMemoInsert = Notification.Name(rawValue: "new Memo")
}
