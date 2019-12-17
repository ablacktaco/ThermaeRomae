//
//  HeheViewController.swift
//  ThermaeRomae
//
//  Created by 陳姿穎 on 2019/11/19.
//  Copyright © 2019 陳姿穎. All rights reserved.
//

import UIKit

class HeheViewController: UIViewController {

    let titles = ["按摩", "半套", "全套"]
    let details = ["$ 800", "$ 1500", "$ 3000"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = "😈"
        navigationController?.navigationBar.tintColor = .black
        
        heheTable.tableFooterView = UIView()
    }
    
    @IBOutlet var heheTable: UITableView!
    
}

extension HeheViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let idnetifier = "heheCell"
        let cell = tableView.dequeueReusableCell(withIdentifier: idnetifier, for: indexPath)
        
        cell.textLabel?.text = titles[indexPath.row]
        cell.detailTextLabel?.text = details[indexPath.row]
        
        return cell
    }
    
    
}
