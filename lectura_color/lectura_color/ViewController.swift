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
        // Do any additional setup after loading the view.
        let myView = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        myView.backgroundColor = UIColor.red
        self.view.addSubview(myView)
        myView.frame = CGRect(x: 50, y: 50, width: 200, height: 200)
        
        print("viewDidLoad")
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

