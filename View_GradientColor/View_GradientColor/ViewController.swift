//
//  ViewController.swift
//  View_GradientColor
//
//  Created by sujustin on 2017/11/17.
//  Copyright © 2017年 SuJustin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var gradientLayer: CAGradientLayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        createGradientLayerCustom()
    }
    
    func createGradientLayer() {
        gradientLayer = CAGradientLayer()
        gradientLayer.frame = self.view.bounds
        gradientLayer.colors = [UIColor.red.cgColor, UIColor.yellow.cgColor]
        
        //會覆蓋到原本的layer上
        self.view.layer.addSublayer(gradientLayer)
        //加入 layer 到 z(index) 層
//        self.view.layer.insertSublayer(gradientLayer, at: 0)
    }
    //UIColor after init has been add '.cgColor'
    func createGradientLayerCustom() {
        gradientLayer = CAGradientLayer()
        gradientLayer.frame = self.view.bounds
        gradientLayer.colors = [UIColor.blue.cgColor, UIColor.init(rgb: 0xFF0000).cgColor]
        gradientLayer.startPoint = CGPoint.init(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint.init(x: 1, y: 1)
        self.view.layer.addSublayer(gradientLayer)
    }
}

extension UIColor{
    convenience init(red: Int, green: Int, blue: Int, a: CGFloat = 1.0) {
        self.init(
            red: CGFloat(red) / 255.0,
            green: CGFloat(green) / 255.0,
            blue: CGFloat(blue) / 255.0,
            alpha: a
        )
    }

    convenience init(rgb: Int, a: CGFloat = 1.0) {
        self.init(
            red: (rgb >> 16) & 0xFF,
            green: (rgb >> 8) & 0xFF,
            blue: rgb & 0xFF,
            a: a
        )
    }
}
