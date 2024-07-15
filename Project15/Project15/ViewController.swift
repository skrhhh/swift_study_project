//
//  ViewController.swift
//  Project15
//
//  Created by admin on 2024/7/15.
//

import UIKit

class ViewController: UIViewController {
    var currentAnimation = 0
    var showView: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()
        let showBut = UIButton(frame: CGRect(x: 100, y: 100, width: 100, height: 100))
        showBut.backgroundColor = .red
        showBut.addTarget(self, action: #selector(tapped(_:)), for: .touchUpInside)
        view.addSubview(showBut)
        
        showView = UIView(frame: CGRect(x: 100, y: 300, width: 100, height: 100))
        showView.backgroundColor = .white
        view.addSubview(showView)
    }
    
    @objc func tapped(_ sender: UIButton) {
        sender.isHidden = true

        UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 5, options: [], animations: {
            switch self.currentAnimation {
            case 0:
                self.showView.transform = CGAffineTransform(scaleX: 2, y: 2)
            case 1:
                self.showView.transform = .identity
            case 2:
                self.showView.transform = CGAffineTransform(translationX: -256, y: -256)
            case 3:
                self.showView.transform = .identity
            case 4:
                self.showView.transform = CGAffineTransform(rotationAngle: CGFloat.pi)
            case 5:
                self.showView.transform = .identity
            case 6:
                self.showView.alpha = 0.1
                self.showView.backgroundColor = UIColor.green
            case 7:
                self.showView.alpha = 1
                self.showView.backgroundColor = UIColor.white
            default:
                break
            }
        }) { finished in
            sender.isHidden = false
        }

        currentAnimation += 1

        if currentAnimation > 7 {
            currentAnimation = 0
        }
    }


}

