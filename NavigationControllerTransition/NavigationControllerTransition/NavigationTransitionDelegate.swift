//
//  NavigationTransitionDelegate.swift
//  NavigationControllerTransition
//
//  Created by guomin on 16/4/6.
//  Copyright © 2016年 iBinaryOrg. All rights reserved.
//

import UIKit

class NavigationTransitionDelegate: NSObject, UINavigationControllerDelegate {
    
    var interactive = false
    let interactionController = UIPercentDrivenInteractiveTransition()
    
    func navigationController(navigationController: UINavigationController, animationControllerForOperation operation: UINavigationControllerOperation, fromViewController fromVC: UIViewController, toViewController toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
//        return nil
        return NavigationTransitionAnimator(type: operation)
    }
    
    func navigationController(navigationController: UINavigationController, interactionControllerForAnimationController animationController: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
        return interactive ? interactionController : nil
    }
}
