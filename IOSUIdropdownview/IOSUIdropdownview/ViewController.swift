//
//  ViewController.swift
//  IOSUIdropdownview
//
//  Created by sujustin on 2017/1/7.
//  Copyright © 2017年 sujustin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var mainViewConstraint: CGFloat!
    var mainViewOriginY: CGFloat!
    
    @IBOutlet var panGesture: UIPanGestureRecognizer!
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var topLayoutConstraintofMainView: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mainViewConstraint = topLayoutConstraintofMainView.constant
        mainViewOriginY = mainView.frame.origin.y
        panGesture.addTarget(self, action: Selector(("pan:")))
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func pan(recongnizer: UIPanGestureRecognizer) {
        if panGesture.state == UIGestureRecognizerState.ended {
            UIView.animate(withDuration: 0.4, delay: 0, options: UIViewAnimationOptions.curveEaseInOut, animations: { () -> Void in
                recongnizer.view?.frame.origin.y = self.mainViewOriginY
                }, completion: { (success) -> Void in
                    if success {
                        self.topLayoutConstraintofMainView.constant = self.mainViewConstraint
                    }
            })
            return
        }
        let y = panGesture.translation(in: self.view).y
        topLayoutConstraintofMainView.constant = mainViewConstraint + y
    }


}

