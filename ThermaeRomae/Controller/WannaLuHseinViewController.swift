//
//  WannaLuHseinViewController.swift
//  ThermaeRomae
//
//  Created by 陳姿穎 on 2019/11/19.
//  Copyright © 2019 陳姿穎. All rights reserved.
//

import UIKit

class WannaLuHseinViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        beverageImage.isHidden = true
        navigationItem.title = "好想露仙浴池"
        navigationController?.navigationBar.tintColor = .black
        let backButton = UIBarButtonItem(title: "Back", style: .plain, target: self, action: nil)
        navigationItem.backBarButtonItem = backButton
    }
    
    @IBOutlet var cupLabel: UILabel!
    @IBOutlet var dobbyButton: UIButton!
    @IBAction func tapToChooseBeverage(_ sender: UIButton) {
        if let beverageVC = storyboard?.instantiateViewController(withIdentifier: "beverageVC") as? BeverageViewController {
            beverageVC.luhseinVC = self
            self.navigationController?.pushViewController(beverageVC, animated: true)
        }
    }
    
    @IBOutlet var beverageImage: UIImageView!
    @IBAction func tapToHehe(_ sender: UIButton) {
        if let heheVC = storyboard?.instantiateViewController(withIdentifier: "heheVC") as? HeheViewController {
            navigationController?.pushViewController(heheVC, animated: true)
        }
        
    }

}
