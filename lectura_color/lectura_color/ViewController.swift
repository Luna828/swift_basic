//
//  ViewController.swift
//  lectura_color
//
//  Created by t2023-m0050 on 2023/07/31.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDataSource, UIDocumentPickerDelegate, UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        data.count
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return data[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let selectedValue = data[row]
        print("check", selectedValue)
    }
    
    let pickerView = UIPickerView()
    let data = ["1","2","3"]
    override func viewDidLoad() {
        pickerView.frame = CGRect(x: 100, y: 100, width: 200, height: 200)
        self.view.addSubview(pickerView)
        pickerView.dataSource = self
        pickerView.delegate = self
        
        
    }
}

