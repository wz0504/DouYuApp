//
//  UIBarButton-extension.swift
//  DouYuTV
//
//  Created by Apple on 16/10/13.
//  Copyright © 2016年 Apple. All rights reserved.
//

import UIKit

extension UIBarButtonItem {
    //1.为UIBarButtonItem 添加类方法
    
    class func createItem(imageName:String,highImageName:String,size:CGSize) ->UIBarButtonItem {
        let btn = UIButton()
        btn.setImage(UIImage(named:imageName) , forState: .Normal)
        btn.setImage(UIImage(named:highImageName) , forState: .Highlighted)
        btn.frame = CGRect(origin: CGPointZero, size: size)
        
        return UIBarButtonItem(customView: btn)
        
    }
    
    
    //2.便利构造函数 ，特征：1.必须以convenience开头  2.在构造函数中必须明确调用一个设计的（原生）构造函数（self）
    
    //String = "" 和 CGSize = CGSizeZero  的意思，可以不传这类参数 ，直接使用imageName一个参数也可以了
    convenience init(imageName:String,highImageName:String = "",size:CGSize = CGSizeZero) {
        //1.创建button
        let btn = UIButton()
        
        //2.设置button的图片
        btn.setImage(UIImage(named:imageName) , forState: .Normal)
        
        if highImageName != "" {
            btn.setImage(UIImage(named:highImageName) , forState: .Highlighted)
        }
        
        //3.设置button的尺寸
        if size == CGSizeZero {
            btn.sizeToFit()
        }else {
            btn.frame = CGRect(origin: CGPointZero, size: size)
        }

        //4.使用设计的函数创建UIBarButton
        self.init(customView: btn)
        
    }
    
}