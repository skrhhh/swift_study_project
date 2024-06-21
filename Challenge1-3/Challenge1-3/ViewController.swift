//
//  ViewController.swift
//  Challenge1-3
//
//  Created by admin on 2024/6/20.
//

import UIKit

class ViewController: UITableViewController {
    
    var countries: [String] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        
        let fm = FileManager.default
        let path = Bundle.main.resourcePath!
        let items = try! fm.contentsOfDirectory(atPath: path)
        
        for item in items {
            if item.hasSuffix("2x.png"){
                countries.append(item)
            }
        }
        
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return countries.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.imageView?.image = UIImage(named: countries[indexPath.row])
        cell.imageView?.contentMode = .scaleAspectFit
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = ImageDetaiViewController()
        vc.selectedImage = countries[indexPath.row]
        navigationController?.pushViewController(vc, animated: true)
    }
        


}

