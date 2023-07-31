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
        
        let imageview = UIImageView(frame: CGRect(x: 100, y: 100, width: 200, height: 200))
        let img = UIImage(systemName: "folder.fill")
        imageview.image = img
        imageview.contentMode = .scaleAspectFit
        self.view.addSubview(imageview)

    }
    

}

