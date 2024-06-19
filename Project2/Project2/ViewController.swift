//
//  ViewController.swift
//  Project2
//
//  Created by admin on 2024/6/19.
//

import UIKit

class ViewController: UIViewController {
    
    let width = UIScreen.main.bounds.width
    
//    lazy var button1 = UIButton(frame: CGRect(x: Int(width - 200)/2, y: 100, width: 200, height: 100))
//    lazy var button2 = UIButton(frame: CGRect(x: Int(width - 200)/2, y: 230, width: 200, height: 100))
//    lazy var button3 = UIButton(frame: CGRect(x: Int(width - 200)/2, y: 360, width: 200, height: 100))
    
    lazy var button1 = UIButton()
    lazy var button2 = UIButton()
    lazy var button3 = UIButton()
    
    var countries = [String]()
    var score: Int = 0
    var correctAnswer = 0
    
    var counter: Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        //禁用自动转换
        button1.translatesAutoresizingMaskIntoConstraints = false
        button2.translatesAutoresizingMaskIntoConstraints = false
        button3.translatesAutoresizingMaskIntoConstraints = false
        
        countries += ["estonia", "france", "germany", "ireland", "italy", "monaco", "nigeria", "poland", "russia", "spain", "uk", "us"]

        view.addSubview(button1)
        view.addSubview(button2)
        view.addSubview(button3)
        
//        button1.setImage(UIImage(named: "us"), for: .normal)
//        button2.setImage(UIImage(named: "us"), for: .normal)
//        button3.setImage(UIImage(named: "us"), for: .normal)
        askQuestion()
        
        button1.layer.borderWidth = 1
        button2.layer.borderWidth = 1
        button3.layer.borderWidth = 1
        
        button1.layer.borderColor = UIColor.lightGray.cgColor
        button2.layer.borderColor = UIColor.lightGray.cgColor
        button3.layer.borderColor = UIColor.lightGray.cgColor
        
        button1.tag = 0
        button2.tag = 1
        button3.tag = 2
        
        button1.addTarget(self, action: #selector(buttonTapped(sender: )), for: .touchUpInside)
        button2.addTarget(self, action: #selector(buttonTapped(sender: )), for: .touchUpInside)
        button3.addTarget(self, action: #selector(buttonTapped(sender: )), for: .touchUpInside)
        
        //宽高
        NSLayoutConstraint.activate([
            button1.widthAnchor.constraint(equalToConstant: 200),
            button1.heightAnchor.constraint(equalToConstant: 100),
            button2.widthAnchor.constraint(equalToConstant: 200),
            button2.heightAnchor.constraint(equalToConstant: 100),
            button3.widthAnchor.constraint(equalToConstant: 200),
            button3.heightAnchor.constraint(equalToConstant: 100)
        ])
        
        //水平居中
        NSLayoutConstraint.activate([
            button1.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button2.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button3.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        //垂直布局
        NSLayoutConstraint.activate([
            button2.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            button1.centerYAnchor.constraint(equalTo: button2.centerYAnchor, constant: -200),
            button3.centerYAnchor.constraint(equalTo: button2.centerYAnchor, constant: 200)
        ])
    }
    
    
    func askQuestion(action: UIAlertAction! = nil){
        
        if counter == 10 {
            let ac = UIAlertController(title: "Final Score", message: "Score: \(score)", preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "YES", style: .cancel))
            self.present(ac, animated: true)
        }
        
        countries.shuffle()
        button1.setImage(UIImage(named: countries[0]), for: .normal)
        button2.setImage(UIImage(named: countries[1]), for: .normal)
        button3.setImage(UIImage(named: countries[2]), for: .normal)
        
        correctAnswer = Int.random(in: 0...2)
        title = "Question: \(countries[correctAnswer].uppercased())  Current Score: \(score)"
    }
    
    @objc func buttonTapped(sender: UIButton){
        var title: String
        if sender.tag == correctAnswer {
            title = "Correct"
            score += 1
        }else{
            title = "Wrong"
            score -= 1
        }
        
        counter += 1
        
        let ac = UIAlertController(
            title: title,
            message:
                """
                You're wrong. That's \(countries[sender.tag])
                Your score is \(score).
                """,
            preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "Continue", style: .default, handler: askQuestion))
        present(ac, animated: true)
    }
    
}

