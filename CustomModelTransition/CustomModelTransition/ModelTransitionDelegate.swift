//
//  ModelTransitionDelegate.swift
//  CustomModelTransition
//
//  Created by guomin on 16/3/16.
//  Copyright © 2016年 iBinaryOrg. All rights reserved.
//

import UIKit

class ModelTransitionDelegate: NSObject,  UIViewControllerTransitioningDelegate {
    
    func animationControllerForPresentedController(presented: UIViewController, presentingController presenting: UIViewController, sourceController source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
//        return ModelTransitionAnimator() //1
        return ModelTransitionAnimator_Circel() //2
    }
    
    func animationControllerForDismissedController(dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
//        return ModelTransitionAnimator() //1
        return ModelTransitionAnimator_Circel() //2
    }
}
