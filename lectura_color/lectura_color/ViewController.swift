//
//  ViewController.swift
//  lectura_color
//
//  Created by t2023-m0050 on 2023/07/31.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate {
    var scrollView: UIScrollView!
    var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView = UIScrollView(frame: CGRect(origin: CGPoint(x: 0, y: 300), size: CGSize(width: view.bounds.width, height: 300)))
        scrollView.delegate = self
        
        let image = UIImage(systemName: "folder.fill")
        imageView = UIImageView(image: image)
        imageView.contentMode = .scaleAspectFit
        imageView.frame = CGRect(origin: .zero, size: CGSize(width: 100, height: 100))
        
        scrollView.addSubview(imageView)
        
        scrollView.contentSize
        = CGSize(width: view.bounds.width * 2, height: 300 * 2)
        
        view.addSubview(scrollView)
        
        
    }
}

