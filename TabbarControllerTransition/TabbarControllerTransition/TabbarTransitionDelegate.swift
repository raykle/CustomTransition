//
//  TabbarControllerDelegate.swift
//  TabbarControllerTransition
//
//  Created by guomin on 16/4/6.
//  Copyright © 2016年 iBinaryOrg. All rights reserved.
//

import UIKit

class TabbarTransitionDelegate: NSObject, UITabBarControllerDelegate {
    func tabBarController(tabBarController: UITabBarController, animationControllerForTransitionFromViewController fromVC: UIViewController, toViewController toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return nil
    }
    
    func tabBarController(tabBarController: UITabBarController, interactionControllerForAnimationController animationController: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
        return nil
    }
}
