//
//  ImageDetaiViewController.swift
//  Challenge1-3
//
//  Created by admin on 2024/6/20.
//

import Foundation
import UIKit
class ImageDetaiViewController: UIViewController {
    
    var selectedImage: String?
    let bounds = UIScreen.main.bounds
    
    lazy var detailView: UIImageView = {
        let view = UIImageView(frame: CGRect(x: 0, y: (bounds.height - 200)/2, width: bounds.width, height: 200))
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(detailView)
        if let imageName = selectedImage {
            detailView.image = UIImage(named: imageName)
        }
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(shareImage))
        
    }
    
    
    @objc func shareImage(){
        guard let imageData = detailView.image?.jpegData(compressionQuality: 0.8) else {
            print("NO Image")
            return
        }
        let vc = UIActivityViewController(activityItems: [imageData, "\(selectedImage ?? "")"], applicationActivities: [])
//        vc.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
        self.present(vc, animated: true)
    }
}
