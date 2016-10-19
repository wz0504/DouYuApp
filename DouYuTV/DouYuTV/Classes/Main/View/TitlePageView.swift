//
//  PageTitleView.swift
//  DouYuTV
//
//  Created by Apple on 16/10/19.
//  Copyright © 2016年 Apple. All rights reserved.
//

import UIKit

private let kscrollLineH:CGFloat = 2
class PageTitleView: UIView {

    //MARK:- 属性
    private var titles:[String]

    //MARK:- 懒加载属性
    private lazy var scrollView:UIScrollView = {
       let scrollView = UIScrollView()
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.scrollsToTop = false
        scrollView.bounces = false
        return scrollView
    }()
    
    private lazy var scrollLine:UIView = {
       let scrollLine = UIView()
        scrollLine.backgroundColor = UIColor.orangeColor()
        return scrollLine
    }()
    
    private lazy var titleLabels:[UILabel] = [UILabel]()
    //MARK:- 自定义构造函数
    init(frame: CGRect,titles:[String]) {
        self.titles = titles
        super.init(frame: frame)
        
        //设置UI界面
        self.setupUI()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}


//MARK:- 设置UI界面
extension PageTitleView {
    
    private func setupUI(){
        //1.添加ScollView
        addSubview(scrollView)
        scrollView.frame = bounds
        
        //2.添加title对应的Label
        setupTitleLabels()
        
        //3.添加底线和滚动的滑块
        setupBottomLineAndScrollLine()
    }
    
    private func setupTitleLabels(){
        
        let labelY :CGFloat = 0
        let labelW :CGFloat = frame.width / CGFloat(titles.count)
        let labelH :CGFloat = frame.height - kscrollLineH
        for(index,title) in titles.enumerate() {
            //1.创建label
            let label = UILabel()
            
            //2.设置label的属性
            label.text = title
            label.tag = index
            label.textAlignment = .Center
            label.font = UIFont.systemFontOfSize(16.0)
            label.textColor = UIColor.darkGrayColor()
            
            //3.设置label的frame
            let labelX :CGFloat = labelW * CGFloat(index)
            
            label.frame = CGRect(x: labelX, y: labelY, width: labelW, height: labelH)
            
            //4.添加到scrollView中
            scrollView.addSubview(label)
            
            titleLabels.append(label)
        }
    }
    private func setupBottomLineAndScrollLine(){
        //1.添加底线
        let bottomLine = UIView()
        bottomLine.backgroundColor = UIColor.lightGrayColor()
        let lineH:CGFloat = 0.5
        bottomLine.frame = CGRect(x: 0, y: frame.height-0.5, width: frame.width, height: lineH)
        addSubview(bottomLine)
        
        //2. 添加scrollLine
        //2.1 获取第一个label
        guard let firstLabel = titleLabels.first else {return}
        firstLabel.textColor = UIColor.orangeColor()
        scrollView.addSubview(scrollLine)
        scrollLine.frame = CGRect(x: firstLabel.frame.origin.x, y: frame.height-kscrollLineH, width: firstLabel.frame.width, height: kscrollLineH)
    }
}
