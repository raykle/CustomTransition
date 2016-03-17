//
//  ModelTransitionAnimator-Circel.swift
//  CustomModelTransition
//
//  Created by guomin on 16/3/17.
//  Copyright © 2016年 iBinaryOrg. All rights reserved.
//

import UIKit
/// 圆形变换
class ModelTransitionAnimator_Circel: NSObject, UIViewControllerAnimatedTransitioning {
    weak var transitionContext: UIViewControllerContextTransitioning?
    var isPresent: Bool?
    
    func transitionDuration(transitionContext: UIViewControllerContextTransitioning?) -> NSTimeInterval {
        return 0.3;
    }
    
    func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
        guard let fromVC = transitionContext.viewControllerForKey(UITransitionContextFromViewControllerKey), let toVC = transitionContext.viewControllerForKey(UITransitionContextToViewControllerKey) else {
            return;
        }
        guard let containerView = transitionContext.containerView() else {
            return;
        }
        
        self.transitionContext = transitionContext
        
        let fromView = fromVC.view
        let toView = toVC.view
        
        let duration = self.transitionDuration(transitionContext)
        
        let width = CGFloat(0)
        let fromRect = CGRectMake(fromView.center.x - width, fromView.center.y - width, width, width)
        let fromPath = UIBezierPath(ovalInRect: fromRect)
        
        let toRadius = sqrt((fromView.center.x * fromView.center.x) + (fromView.center.y * fromView.center.y))
        let toPath = UIBezierPath(ovalInRect: CGRectInset(fromRect, -toRadius, -toRadius))
        
        let shapLayer = CAShapeLayer()
        shapLayer.path = toPath.CGPath
        
        if toVC.isBeingPresented() {
            self.isPresent = true
            containerView.addSubview(toView)
            
            toView.layer.mask = shapLayer
            
            let maskLayerAnimation = CABasicAnimation(keyPath: "path")
            maskLayerAnimation.fromValue = fromPath.CGPath//<--
            maskLayerAnimation.toValue = toPath.CGPath//<--
            maskLayerAnimation.duration = duration
            maskLayerAnimation.delegate = self
            shapLayer.addAnimation(maskLayerAnimation, forKey: "path")
        }
        else if fromVC.isBeingDismissed() {
            self.isPresent = false
            
            //处理 Dismiss 转场，.Custom模式下不要将toView添加到containerView
            
            fromView.layer.mask = shapLayer
            
            let maskLayerAnimation = CABasicAnimation(keyPath: "path")
            maskLayerAnimation.fromValue = toPath.CGPath//<--
            maskLayerAnimation.toValue = fromPath.CGPath//<--
            maskLayerAnimation.duration = duration
            maskLayerAnimation.delegate = self
            shapLayer.addAnimation(maskLayerAnimation, forKey: "path")
        }
    }
    
    override func animationDidStop(anim: CAAnimation, finished flag: Bool) {
        self.transitionContext?.completeTransition(!self.transitionContext!.transitionWasCancelled())
        self.transitionContext?.viewControllerForKey(self.isPresent! ? UITransitionContextToViewControllerKey : UITransitionContextFromViewControllerKey)?.view.layer.mask = nil
    }
}
