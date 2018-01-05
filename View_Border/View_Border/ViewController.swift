//
//  ViewController.swift
//  View_Border
//
//  Created by sujustin on 2017/7/3.
//  Copyright © 2017年 IDvances. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var ViewBorder: UIView!
    @IBOutlet weak var ViewCorner: UIView!
    @IBOutlet weak var ViewShandow: UIView!
    @IBOutlet weak var test: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Right UI -> Corner
        ViewBorder.layer.borderWidth = 3
        ViewBorder.layer.borderColor = UIColor.cyan.cgColor
        
        ViewCorner.layer.cornerRadius = 20
        ViewCorner.layer.borderWidth = 3
        ViewCorner.layer.borderColor = UIColor.red.cgColor
        
        //Opacity -> 不透明
        ViewShandow.layer.shadowColor = UIColor.black.cgColor
        ViewShandow.layer.shadowRadius = 5
        ViewShandow.layer.shadowOpacity = 1
        ViewShandow.layer.shadowOffset = CGSize.init(width: 3, height: 2)
        ViewShandow.clipsToBounds = false
        
    }
}

