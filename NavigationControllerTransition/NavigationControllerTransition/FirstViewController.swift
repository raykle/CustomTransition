//
//  ViewController.swift
//  NavigationControllerTransition
//
//  Created by guomin on 16/4/6.
//  Copyright © 2016年 iBinaryOrg. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {
    
    var navTransitionDelegate: NavigationTransitionDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        navTransitionDelegate = NavigationTransitionDelegate()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func pushAction() {
        self.performSegueWithIdentifier("pushSegue", sender: nil)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        self.navigationController?.delegate = navTransitionDelegate;
    }

}

