//
//  ViewController.swift
//  ThermaeRomae
//
//  Created by 陳姿穎 on 2019/11/19.
//  Copyright © 2019 陳姿穎. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var wannaData: WannaData?
    var luhseinData: LuHseinData?
    var wannaLuhseinData: WannaLuHseinData?
    
    @IBOutlet var customerName: UITextField!
    @IBOutlet var wannaButton: UIButton!
    @IBOutlet var wannaIntroduse: UILabel!
    @IBOutlet var luhseinButton: UIButton!
    @IBOutlet var luhseinIntroduce: UILabel!
    @IBOutlet var wannaLuhseinButton: UIButton!
    @IBOutlet var wannaLuhseinIntroduce: UILabel!
    @IBAction func tapToEnter(_ sender: UIButton) {
        
        let customer = Customer(name: customerName.text!.trimmingCharacters(in: .whitespaces))
        guard let uploadData = try? JSONEncoder().encode(customer) else { return }
                
        let url = URL(string: "https://d986577a.ngrok.io/api/enter")!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
                
        let task = URLSession.shared.uploadTask(with: request, from: uploadData) { (data, response, error) in
            if let error = error {
            print ("error: \(error)")
                return
            }
            if let response = response as? HTTPURLResponse {
                print("status code: \(response.statusCode)")
                if let mimeType = response.mimeType,
                    mimeType == "application/json",
                    let data = data,
                    let dataString = String(data: data, encoding: .utf8) {
                    print ("got data: \(dataString)")
                    DispatchQueue.main.async {
                        if let luhseinVC = self.storyboard?.instantiateViewController(withIdentifier: "luhseinVC") as? WannaLuHseinViewController {
                            self.navigationController?.pushViewController(luhseinVC, animated: true)
                        }
                    }
                }
            }
        }
        task.resume()
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let backButton = UIBarButtonItem(title: "Back", style: .plain, target: self, action: nil)
        navigationItem.backBarButtonItem = backButton
        
        getWannaData()
        getLuhseinData()
        getWannaLuHseinData()
        
        while wannaData == nil {}
        while luhseinData == nil {}
        while wannaLuhseinData == nil {}
        
        let wannaTitle = "\(wannaData!.poolName)  \(wannaData!.peopleAmount)/\(wannaData!.upperLimit)"
        wannaButton.setTitle(wannaTitle, for: .normal)
        wannaIntroduse.text = "\(wannaData!.introduction)"

        luhseinButton.setTitle("露仙浴池  \(luhseinData!.pmany)/10", for: .normal)

        let wannaLuhseinTitle = "\(wannaLuhseinData!.name)  \(wannaLuhseinData!.quantity)/\(wannaLuhseinData!.limit)"
        wannaLuhseinButton.setTitle(wannaLuhseinTitle, for: .normal)
        wannaLuhseinIntroduce.text = "\(wannaLuhseinData!.introduction)"
        
    }
    
}

extension ViewController {
    
    func getWannaData() {
        let address = "https://0a3ceddf.ngrok.io/api/PoolStatus"
        if let url = URL(string: address) {
            URLSession.shared.dataTask(with: url) { (data, response, error) in
                if let error = error {
                    print("error: \(error.localizedDescription)")
                    return
                }
                guard let data = data else { return }
                if let response = response as? HTTPURLResponse {
                    print("wanna status code: \(response.statusCode)")
                    if let wannaData = try? JSONDecoder().decode(WannaData.self, from: data) {
                        self.wannaData = wannaData
                    }
                }
            }.resume()
        }
    }
    
    func getLuhseinData() {
        let address = "https://999db0b7.ngrok.io/api/pools"
        if let url = URL(string: address) {
            URLSession.shared.dataTask(with: url) { (data, response, error) in
                if let error = error {
                    print("error: \(error.localizedDescription)")
                    return
                }
                guard let data = data else { return }
                if let response = response as? HTTPURLResponse {
                    print("luhsein status code: \(response.statusCode)")
                    if let luhseinData = try? JSONDecoder().decode(LuHseinData.self, from: data) {
                        self.luhseinData = luhseinData
                    }
                }
            }.resume()
        }
    }
    
    func getWannaLuHseinData() {
        let address = "https://d986577a.ngrok.io/api/Status"
        if let url = URL(string: address) {
            URLSession.shared.dataTask(with: url) { (data, response, error) in
                if let error = error {
                    print("error: \(error.localizedDescription)")
                    return
                }
                guard let data = data else { return }
                if let response = response as? HTTPURLResponse {
                    print("wanna luhsein status code: \(response.statusCode)")
                    if let wannaLuhseinData = try? JSONDecoder().decode(WannaLuHseinData.self, from: data) {
                        self.wannaLuhseinData = wannaLuhseinData
                    }
                }
            }.resume()
        }
    }
    
}

extension ViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
}
