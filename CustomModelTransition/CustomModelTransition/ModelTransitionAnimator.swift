//
//  ModelTransitionAnimator.swift
//  CustomModelTransition
//
//  Created by guomin on 16/3/16.
//  Copyright © 2016年 iBinaryOrg. All rights reserved.
//

import UIKit

/// 渐隐变化
class ModelTransitionAnimator: NSObject, UIViewControllerAnimatedTransitioning {
    
    func transitionDuration(transitionContext: UIViewControllerContextTransitioning?) -> NSTimeInterval {
        return 0.4;
    }
    
    func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
        guard let fromVC = transitionContext.viewControllerForKey(UITransitionContextFromViewControllerKey), let toVC = transitionContext.viewControllerForKey(UITransitionContextToViewControllerKey) else {
            return;
        }
        guard let containerView = transitionContext.containerView() else {
            return;
        }
        
        let fromView = fromVC.view
        let toView = toVC.view
        
        let duration = self.transitionDuration(transitionContext)
        
        if toVC.isBeingPresented() {
            containerView.addSubview(toView)
            
            toView.alpha = 0.0
            
            UIView.animateWithDuration(duration, animations: {
                toView.alpha = 1
                }, completion: { _ in
                    let isCanceled = transitionContext.transitionWasCancelled()
                    transitionContext.completeTransition(!isCanceled)
            })
        }
        else if fromVC.isBeingDismissed() {
            UIView.animateWithDuration(duration, animations: { () -> Void in
                fromView.alpha = 0.0
                }, completion: { _ in
                    let isCancel = transitionContext.transitionWasCancelled()
                    transitionContext.completeTransition(!isCancel)
            })
        }
    }
}
