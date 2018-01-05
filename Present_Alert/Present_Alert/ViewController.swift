//
//  ViewController.swift
//  Present_Alert
//
//  Created by sujustin on 2017/11/22.
//  Copyright © 2017年 SuJustin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let alertVC = "alertViewController"
    var myAlert: alertViewController!

    override func viewDidLoad() {
        super.viewDidLoad()
        myAlert = storyboard?.instantiateViewController(withIdentifier: alertVC) as! alertViewController
    }
    //UI Modal Presentation Style
    @IBAction func NoneAction(_ sender: UIButton) {
        myAlert.modalPresentationStyle = UIModalPresentationStyle.none
        self.present(myAlert, animated: true, completion: nil)
    }
    @IBAction func FormSheet(_ sender: UIButton) {
        myAlert.modalPresentationStyle = UIModalPresentationStyle.formSheet
        myAlert.modalTransitionStyle = UIModalTransitionStyle.crossDissolve
        self.present(myAlert, animated: true, completion: nil)
    }
    @IBAction func FullScreen(_ sender: UIButton) {
        myAlert.modalPresentationStyle = UIModalPresentationStyle.fullScreen
        myAlert.modalTransitionStyle = UIModalTransitionStyle.coverVertical
        self.present(myAlert, animated: true, completion: nil)
    }
    @IBAction func Popover(_ sender: UIButton) {
        myAlert.modalPresentationStyle = UIModalPresentationStyle.popover
        myAlert.modalTransitionStyle = UIModalTransitionStyle.flipHorizontal
        self.present(myAlert, animated: true, completion: nil)
    }
    @IBAction func PageSheet(_ sender: Any) {
        myAlert.modalPresentationStyle = UIModalPresentationStyle.pageSheet
        myAlert.modalTransitionStyle = UIModalTransitionStyle.partialCurl
        self.present(myAlert, animated: true, completion: nil)
    }
    @IBAction func CurrentContext(_ sender: Any) {
        myAlert.modalPresentationStyle = UIModalPresentationStyle.currentContext
        self.present(myAlert, animated: true, completion: nil)
    }
    @IBAction func OverFullScreen(_ sender: Any) {
        myAlert.modalPresentationStyle = UIModalPresentationStyle.overFullScreen
        self.present(myAlert, animated: true, completion: nil)
    }
    @IBAction func overCurrent(_ sender: UIButton) {
        myAlert.modalPresentationStyle = UIModalPresentationStyle.overCurrentContext
        self.present(myAlert, animated: true, completion: nil)
    }
    
}

