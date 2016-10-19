//
//  HomeViewController.swift
//  DouYuTV
//
//  Created by Apple on 16/10/13.
//  Copyright © 2016年 Apple. All rights reserved.
//

import UIKit

private let kTitleViewH :CGFloat = 40
class HomeViewController: UIViewController {

    
    //MARK:- 懒加载属性
    private lazy var pageTitleView:PageTitleView = {
       let frame = CGRect(x: 0, y: kStatusBarH+kNavigationBarH, width: kScreenW, height: kTitleViewH)
        let titles = ["推荐","游戏","娱乐","趣玩"]
        let titleView = PageTitleView(frame: frame, titles: titles)
        return titleView
    }()
    //MARK:- 系统的回调方法
    override func viewDidLoad() {
        super.viewDidLoad()
        automaticallyAdjustsScrollViewInsets = false //当有导航栏的时候，scrollView会自己添加64的内边距，false 取消内边距
        //1.设置UI界面
        self.setupUI()

        
    }

    
    

}

//设置UI界面
extension HomeViewController {
    private func setupUI() {
        //1.设置导航栏
        self.setupNavigationBar()
        
        //.2 添加titleView
        view.addSubview(pageTitleView)
    }
    
    private func setupNavigationBar() {
        
        //使用 扩展方法的类方法 之前 
        
        /*
        //1.设置左边的logo
        let btn = UIButton()
        btn.setImage(UIImage(named: "logo"), forState: .Normal)
        btn.sizeToFit()
        navigationItem.leftBarButtonItem = UIBarButtonItem.init(customView: btn)
        
        //2.添加右侧的items
        let size = CGSize(width: 40, height: 40)
        let historyItem = UIBarButtonItem.createItem("image_my_history", highImageName: "Image_my_history_click", size: size)
        
        let searchItem = UIBarButtonItem.createItem("btn_search", highImageName: "btn_search_clicked", size: size)
        
        let qrcodeItem = UIBarButtonItem.createItem("Image_scan", highImageName: "Image_scan_click", size: size)
        
        navigationItem.rightBarButtonItems = [historyItem,searchItem,qrcodeItem]
        
        */
        
        
        //使用之后
        
        //1.设置左边的logo
        navigationItem.leftBarButtonItem = UIBarButtonItem(imageName: "logo")
        
        //2.添加右侧的items
        let size = CGSize(width: 40, height: 40)
        let historyItem = UIBarButtonItem(imageName: "image_my_history", highImageName: "Image_my_history_click", size: size)
        
        let searchItem = UIBarButtonItem(imageName: "btn_search", highImageName: "btn_search_clicked", size: size)
        
        let qrcodeItem = UIBarButtonItem(imageName: "Image_scan", highImageName: "Image_scan_click", size: size)
        
        navigationItem.rightBarButtonItems = [historyItem,searchItem,qrcodeItem]
        
        
    }
    
}