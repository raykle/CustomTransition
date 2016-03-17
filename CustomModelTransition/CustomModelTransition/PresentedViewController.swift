//
//  PresentedViewController.swift
//  CustomModelTransition
//
//  Created by guomin on 16/3/16.
//  Copyright © 2016年 iBinaryOrg. All rights reserved.
//

import UIKit

class PresentedViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func dismissAction() {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
}