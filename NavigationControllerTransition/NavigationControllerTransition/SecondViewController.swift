//
//  SecondViewController.swift
//  NavigationControllerTransition
//
//  Created by guomin on 16/4/6.
//  Copyright © 2016年 iBinaryOrg. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    let edgePanGesture = UIScreenEdgePanGestureRecognizer()
    var navigationDelegate: NavigationTransitionDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //MARK: 屏幕边缘添加手势操作
        edgePanGesture.edges = .Left
        edgePanGesture.addTarget(self, action: #selector(SecondViewController.handleEdgePanGesture))
        view.addGestureRecognizer(edgePanGesture)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    @IBAction func popAction() {
        self.navigationController?.popViewControllerAnimated(true)
    }

    //MARK: 手势操作具体内容
    func handleEdgePanGesture(gesture: UIScreenEdgePanGestureRecognizer) {
        let translationX = gesture.translationInView(view).x
        let translationBase: CGFloat = view.frame.width / 2
        let translationAbs = max(0, translationX)
        let percent = translationAbs > translationBase ? 1.0 : translationAbs / translationBase
        
        switch gesture.state {
        case .Began:
            navigationDelegate = self.navigationController?.delegate as? NavigationTransitionDelegate
            navigationDelegate?.interactive = true
            self.navigationController?.popViewControllerAnimated(true)
        case .Changed:
            navigationDelegate?.interactionController.updateInteractiveTransition(percent)
        case .Cancelled, .Ended:
            percent > 0.5 ? navigationDelegate?.interactionController.finishInteractiveTransition() : navigationDelegate?.interactionController.cancelInteractiveTransition()
            navigationDelegate?.interactive = false
        default:
            break
        }
    }
}
