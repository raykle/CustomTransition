//
//  ViewController.swift
//  ViewControllerTransition
//
//  Created by guomin on 16/3/9.
//  Copyright © 2016年 iBinaryOrg. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var button: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func circelTapped(sender:UIButton) {
        self.navigationController?.popViewControllerAnimated(true)
    }

}

//extension ViewController: UIViewControllerAnimatedTransitioning {
//    
//}

