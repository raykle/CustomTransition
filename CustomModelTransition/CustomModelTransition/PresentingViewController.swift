//
//  PresentingViewController.swift
//  CustomModelTransition
//
//  Created by guomin on 16/3/16.
//  Copyright © 2016年 iBinaryOrg. All rights reserved.
//

import UIKit

class PresentingViewController: UIViewController {
    @IBOutlet weak var presentButton: UIButton!
    let modelTransitionDelegate = ModelTransitionDelegate()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let presentedVC = segue.destinationViewController as! PresentedViewController
        presentedVC.transitioningDelegate = modelTransitionDelegate
        presentedVC.modalPresentationStyle = .Custom
        super.prepareForSegue(segue, sender: sender)
    }
}
