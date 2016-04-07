//
//  TabbarControllerDelegate.swift
//  TabbarControllerTransition
//
//  Created by guomin on 16/4/6.
//  Copyright © 2016年 iBinaryOrg. All rights reserved.
//

import UIKit

class TabbarTransitionDelegate: NSObject, UITabBarControllerDelegate {
    
    var interactive = false
    let interactionController = UIPercentDrivenInteractiveTransition()
    
    func tabBarController(tabBarController: UITabBarController, animationControllerForTransitionFromViewController fromVC: UIViewController, toViewController toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        
        if !interactive {
            return nil
        }
        
        let fromIndex = tabBarController.viewControllers!.indexOf(fromVC)
        let toIndex = tabBarController.viewControllers!.indexOf(toVC)
        
        let operationDirection: TabbarOperationDirection = toIndex < fromIndex ? TabbarOperationDirection.Right : TabbarOperationDirection.Left
        return TabbarTransitionAnimator(direction: operationDirection)
    }
    
    func tabBarController(tabBarController: UITabBarController, interactionControllerForAnimationController animationController: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
        return interactive ? interactionController : nil
    }
}
