//
//  WebViewController.swift
//  ThermaeRomae
//
//  Created by 陳姿穎 on 2019/11/19.
//  Copyright © 2019 陳姿穎. All rights reserved.
//

import UIKit
import WebKit

class WebViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.tintColor = .black
        
        let url = URL(string: "https://onlystp417.gitlab.io/lusen/titan/")!
        let request = URLRequest(url: url)
        luhseinWeb.load(request)
    }
    
    @IBOutlet var luhseinWeb: WKWebView!

}
