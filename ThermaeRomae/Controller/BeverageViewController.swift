//
//  BeverageViewController.swift
//  ThermaeRomae
//
//  Created by 陳姿穎 on 2019/11/19.
//  Copyright © 2019 陳姿穎. All rights reserved.
//

import UIKit

class BeverageViewController: UIViewController {

    var index: Int?
    var beverageData: LuHseinBeverage = LuHseinBeverage(data: [])
    var luhseinVC: WannaLuHseinViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = "Order Beverage"
        navigationController?.navigationBar.tintColor = .black
        
        getBeverageList { (beverageList) in
            self.beverageData = beverageList
            DispatchQueue.main.async {
                self.beverageTable.reloadData()
            }
        }
        
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        luhseinVC?.dobbyButton.isEnabled = false
        luhseinVC?.cupLabel.isHidden = true
        luhseinVC?.beverageImage.isHidden = false
        switch index! {
        case 0..<color.count:
            self.luhseinVC?.beverageImage.tintColor = color[index!]
        default: break
        }
        UIView.animate(withDuration: 2, animations: {
            self.luhseinVC?.beverageImage.center.x -= 210
        })
    }
    
    
    let color: [UIColor] = [.yellow, .orange, .red, .systemPink]
    
    @IBOutlet var customer: UILabel!
    @IBOutlet var beverageTable: UITableView!
    @IBAction func tapToOrder(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
}


extension BeverageViewController {
    
    func getBeverageList(closure: @escaping (LuHseinBeverage) -> Void) {
        let address = "https://d986577a.ngrok.io/api/drinks"
        if let url = URL(string: address) {
            URLSession.shared.dataTask(with: url) { (data, response, error) in
                if let error = error {
                    print("error: \(error.localizedDescription)")
                    return
                }
                guard let data = data else { return }
                if let response = response as? HTTPURLResponse {
                    print("status code: \(response.statusCode)")
                    if let beverageList = try? JSONDecoder().decode(LuHseinBeverage.self, from: data) {
                        closure(beverageList)
                    }
                }
            }.resume()
        }
    }
    
}

extension BeverageViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return beverageData.data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let identifier = "beverageCell"
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as! BeverageTableViewCell
        
        cell.beverage.text = beverageData.data[indexPath.row].name
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        index = indexPath.row
    }
    
}

extension BeverageViewController: UINavigationControllerDelegate {
    
    
    
    
}
