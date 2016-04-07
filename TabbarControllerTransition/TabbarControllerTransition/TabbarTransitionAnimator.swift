//
//  TabbarTransitionAnimator.swift
//  TabbarControllerTransition
//
//  Created by guomin on 16/4/6.
//  Copyright © 2016年 iBinaryOrg. All rights reserved.
//

import UIKit

enum TabbarOperationDirection {
    case Left
    case Right
}


class TabbarTransitionAnimator: NSObject, UIViewControllerAnimatedTransitioning {
    
    private var operationDirection: TabbarOperationDirection
    
    init(direction: TabbarOperationDirection) {
        operationDirection = direction
        super.init()
    }
    
    func transitionDuration(transitionContext: UIViewControllerContextTransitioning?) -> NSTimeInterval {
        return 0.3
    }
    
    func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
        guard let containerView = transitionContext.containerView(), let fromVC = transitionContext.viewControllerForKey(UITransitionContextFromViewControllerKey), let toVC = transitionContext.viewControllerForKey(UITransitionContextToViewControllerKey) else {
            return
        }
        
        let fromView = fromVC.view
        let toView = toVC.view
        
        var translation = containerView.frame.width
        var fromViewTransform = CGAffineTransformIdentity
        var toViewTransform = CGAffineTransformIdentity
        
        translation = operationDirection == .Left ? translation : -translation
        fromViewTransform = CGAffineTransformMakeTranslation(-translation, 0)
        toViewTransform = CGAffineTransformMakeTranslation(translation, 0)
        
        containerView.addSubview(toView)
        
        toView.transform = toViewTransform
        
        UIView.animateWithDuration(transitionDuration(transitionContext), animations: { 
            toView.transform = CGAffineTransformIdentity
            fromView.transform = fromViewTransform
            }, completion: { (finished: Bool) in
                fromView.transform = CGAffineTransformIdentity
                toView.transform = CGAffineTransformIdentity
                
                let isCanceled = transitionContext.transitionWasCancelled()
                transitionContext.completeTransition(!isCanceled)
        })
    }
}
