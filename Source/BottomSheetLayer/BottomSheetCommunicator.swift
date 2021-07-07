//
//  BottomSheetCommunicator.swift
//  BottomSheetLayer
//
//  Created by Madhusudhan Reddy Putta on 15/06/21.
//

import Foundation
import UIKit

public class BottomSheetCommunicator: NSObject {
        
    weak var animatorController: UIViewController!
    
    lazy var outsideControl: UIControl = {
        
        let control = UIControl()
        control.backgroundColor = UIColor(red: 211/255.0, green: 211/255.0, blue: 211/255.0, alpha: 0.4)
        control.frame = animatorController.view.bounds
        control.addTarget(self, action: #selector(tappeddOnOutside), for: .touchDown)
        
        return control
    }()
        
    lazy var bottomSheetVC: BottomSheetViewController = {
        
        // Adding Animation Controler
        var bottomSheetPopupVC = BottomSheetViewController(nibName: "BottomSheetViewController", bundle: Bundle(for: BottomSheetViewController.self))
        animatorController.addChildViewController(bottomSheetPopupVC)
        animatorController.view.addSubview(bottomSheetPopupVC.view)
        bottomSheetPopupVC.view.frame = CGRect(x: 0, y: animatorController.view.frame.maxY, width: animatorController.view.frame.width, height: animatorController.view.frame.height)
        
        return bottomSheetPopupVC
    }()
    
    public func addBottomSheetView(parentViewController: UIViewController, contentViewController: UIViewController) {
                
        animatorController = parentViewController
        
        // Adding outside view
        animatorController.view.addSubview(outsideControl)
        
        // Add bottom sheet view
        bottomSheetVC.didMove(toParentViewController: animatorController)
            
        // Contentview controller Add
        contentViewController.view.frame = CGRect(x: 0, y: 60, width: animatorController.view.frame.width, height: animatorController.view.frame.height-190)
        bottomSheetVC.addChildViewController(contentViewController)
        bottomSheetVC.view.addSubview(contentViewController.view)
        bottomSheetVC.didMove(toParentViewController: contentViewController)

    }
    
    @objc func tappeddOnOutside(_ sender: UIControl) {
        CloseViewLikeAnimation()
    }
    
    public func CloseViewLikeAnimation() {

        UIView.animate(withDuration: 0.6) {
            let frame = self.animatorController.view.frame
            self.bottomSheetVC.view.frame = CGRect(x: 0, y: UIScreen.main.bounds.height, width: frame.width, height: 0)
        } completion: { finish in
            self.bottomSheetVC.view.removeFromSuperview()
            self.outsideControl.removeFromSuperview()
        }

    }
        
}

