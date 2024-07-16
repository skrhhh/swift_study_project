//
//  DetailViewController.swift
//  Project1
//
//  Created by admin on 2024/6/18.
//

import Foundation
import UIKit
class DetailViewController: UIViewController {
    
    var selectedImage: String?
    var index: Int?
    var allNum: Int?
    
    let bounds = UIScreen.main.bounds
    
    lazy var detailImageView: UIImageView = {
        let view = UIImageView(frame: CGRect(x: 0, y: 0, width: bounds.width, height: bounds.height))
        view.contentMode = .scaleAspectFit
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        title = selectedImage
        title = "第\(index ?? 0)张照片，共\(allNum ?? 0)张照片"
        view.backgroundColor = .white
        navigationItem.largeTitleDisplayMode = .never
        
        if let imageToLoad = selectedImage {
            detailImageView.image = UIImage(named: imageToLoad)
        }
        
        view.addSubview(detailImageView)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.hidesBarsOnTap = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.hidesBarsOnTap = false
    }
}
