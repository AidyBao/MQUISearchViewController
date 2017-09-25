//
//  ViewController.swift
//  MQUISearchViewController
//
//  Created by 120v on 2017/9/25.
//  Copyright © 2017年 MQ. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func beforeClicked(_ sender: Any) {
        self.navigationController?.pushViewController(OlderSearchController(), animated: true)
    }
    
    @IBAction func afterClicked(_ sender: Any) {
        self.navigationController?.pushViewController(NewSearchController(), animated: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

