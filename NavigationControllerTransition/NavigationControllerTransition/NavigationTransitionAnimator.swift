//
//  NavigationTransitionAnimator.swift
//  NavigationControllerTransition
//
//  Created by guomin on 16/4/6.
//  Copyright © 2016年 iBinaryOrg. All rights reserved.
//

import UIKit

class NavigationTransitionAnimator: NSObject, UIViewControllerAnimatedTransitioning {
    
    private var transitionType: UINavigationControllerOperation?
    
    init(type: UINavigationControllerOperation) {
        transitionType = type;
        super.init()
    }

    func transitionDuration(transitionContext: UIViewControllerContextTransitioning?) -> NSTimeInterval {
        return 1
    }
    
    func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
        guard let containerView = transitionContext.containerView(), let fromVC = transitionContext.viewControllerForKey(UITransitionContextFromViewControllerKey),
            let toVC = transitionContext.viewControllerForKey(UITransitionContextToViewControllerKey) else {
                return
        }
        
        let fromView = fromVC.view
        let toView = toVC.view
        
        var translation = containerView.frame.width
        var fromViewTransfrom = CGAffineTransformIdentity
        var toViewTransform = CGAffineTransformIdentity
        
        translation = transitionType! == .Push ? translation : -translation
        fromViewTransfrom = CGAffineTransformMakeTranslation(-translation, 0)
        toViewTransform = CGAffineTransformMakeTranslation(translation, 0)
        
        containerView.addSubview(toView)
        
        toView.transform = toViewTransform
        //MARK: 添加动画
        UIView.animateWithDuration(transitionDuration(transitionContext), animations: { 
            toView.transform = CGAffineTransformIdentity
            fromView.transform = fromViewTransfrom
            }) { (let finished) in
                if finished {
                    fromView.transform = CGAffineTransformIdentity
                    toView.transform = CGAffineTransformIdentity
                }
                
                let isCanceled = transitionContext.transitionWasCancelled()
                transitionContext.completeTransition(!isCanceled)
        }
    }
}
