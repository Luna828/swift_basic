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
        
        let btn = UIButton(frame: CGRect(x: 100, y: 100, width: 200, height: 50))
        btn.setTitle("button", for: .normal)
        btn.backgroundColor = .blue
        btn.addTarget(self, action: #selector(btnAction2), for: .touchUpInside)
        self.view.addSubview(btn)
        
        let mySwitch = UISwitch(frame: CGRect(x: 200, y: 200, width: 100, height: 100))
        mySwitch.isOn = true
        mySwitch.onTintColor = .green
        mySwitch.thumbTintColor = .white
        mySwitch.addTarget(self, action: #selector(switchToggle), for: .valueChanged)
        self.view.addSubview(mySwitch)
        
    }
    @objc func switchToggle(){
        print("switch value changed")
    }
    
    
    @objc func btnAction2(){
        printContent("push")
    }
    
    
}

