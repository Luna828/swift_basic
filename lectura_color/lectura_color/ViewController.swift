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
        
        let button = UIButton(type: .system)
        button.setTitle("Push View Controller", for: .normal)
        button.addTarget(self, action: #selector(pushViewController), for: .touchUpInside)
        button.frame = CGRect(x: 200, y: 200, width: 200, height: 100)
        self.view.addSubview(button)
        
        
        print("viewDidLoad")
    }

    @objc func pushViewController() {
        let newViewController = UIViewController()
        newViewController.title = "New view Controller"
        newViewController.view.backgroundColor = .black
        navigationController?.pushViewController(newViewController, animated: true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("viewWillAppear")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("viewDidAppear")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("viewWillDisappear")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("viewDidDisappear")
    }
    
   

}

