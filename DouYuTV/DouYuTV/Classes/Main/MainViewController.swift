//
//  MainViewController.swift
//  DouYuTV
//
//  Created by Apple on 16/10/5.
//  Copyright © 2016年 Apple. All rights reserved.
//

import UIKit

class MainViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        addChildVc("Home")
        addChildVc("Live")
        addChildVc("Follow")
        addChildVc("Profile")
        
    }

    private func addChildVc(storyName:String) {
        //通过storyboard获取控制器
        let chilaVc = UIStoryboard(name: storyName, bundle: nil).instantiateInitialViewController()!
        
        addChildViewController(chilaVc)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
