//
//  ViewController.swift
//  lectura_color
//
//  Created by t2023-m0050 on 2023/07/31.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let textField = UITextField(frame: CGRect(x: 100, y: 100, width: 200, height: 50))
        textField.placeholder = "이름을 입력하세요"
        self.view.addSubview(textField)
      
    }
    

}

