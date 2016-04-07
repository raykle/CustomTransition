//
//  CustomTabbarController.swift
//  TabbarControllerTransition
//
//  Created by guomin on 16/4/6.
//  Copyright © 2016年 iBinaryOrg. All rights reserved.
//

import UIKit

class CustomTabbarController: UITabBarController {
    
    private var panGesture = UIPanGestureRecognizer()
    private let tabbarControllerDelegate = TabbarTransitionDelegate()
    private var subviewControllersCount: Int {
        let count = viewControllers != nil ? viewControllers!.count : 0
        return count
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        delegate = tabbarControllerDelegate
        
        panGesture.addTarget(self, action: #selector(handelPan))
        view.addGestureRecognizer(panGesture)
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
    
    func handelPan(gesture: UIPanGestureRecognizer) {
        let translationX = panGesture.translationInView(view).x
        let transLationAbs = translationX > 0 ? translationX : -translationX
//        let transLationAbs = max(0, translationX)
        let percent = transLationAbs / view.frame.width
        
        switch gesture.state {
        case .Began:
            tabbarControllerDelegate.interactive = true
            
            let velocityX = gesture.velocityInView(view).x
            if velocityX < 0 {
                if selectedIndex < subviewControllersCount - 1 {
                    selectedIndex += 1
                }
            } else {
                if selectedIndex > 0 {
                    selectedIndex -= 1
                }
            }
        case .Changed:
            tabbarControllerDelegate.interactionController.updateInteractiveTransition(percent)
        case .Cancelled, .Ended:
            
            //引用https://github.com/seedante/iOS-Note/wiki/ViewController-Transition#%E8%BD%AC%E5%9C%BA%E4%BB%A3%E7%90%86 Demo中的描述
            /*这里有个小问题，转场结束或是取消时有很大几率出现动画不正常的问题。在8.1以上版本的模拟器中都有发现，7.x 由于缺乏条件尚未测试，
             但在我的 iOS 9.2 的真机设备上没有发现，而且似乎只在 UITabBarController 的交互转场中发现了这个问题。在 NavigationController 暂且没发现这个问题，
             Modal 转场尚未测试，因为我在 Demo 里没给它添加交互控制功能。
             
             测试不完整，具体原因也未知，不过解决手段找到了。多谢 @llwenDeng 发现这个 Bug 并且找到了解决手段。
             解决手段是修改交互控制器的 completionSpeed 为1以下的数值，这个属性用来控制动画速度，我猜测是内部实现在边界判断上有问题。
             这里其修改为0.99，既解决了 Bug 同时尽可能贴近原来的动画设定。
             */
            tabbarControllerDelegate.interactionController.completionSpeed = 0.99
            
            if percent < 0.3 {
                tabbarControllerDelegate.interactionController.cancelInteractiveTransition()
            } else {
                tabbarControllerDelegate.interactionController.finishInteractiveTransition()
            }
            tabbarControllerDelegate.interactive = false
        default:
            break
        }
    }

}
