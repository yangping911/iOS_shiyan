//
//  ViewController.swift
//  View
//
//  Created by student on 2018/12/15.
//  Copyright © 2018年 2016110340. All rights reserved.
//

import UIKit

//创建自定义的CircleView
class circleView: UIView {
    override func draw(_ rect: CGRect){
        let path = UIBezierPath(ovalIn: rect)
        UIColor.white.setStroke()//白色边界
        path.stroke()
        UIColor.yellow.setFill()//红色填充
        path.fill()
    }
}

class ViewController: UIViewController {
    
    @IBOutlet weak var scrollView: UIScrollView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        drawCircle()
    }
    //圆形
    func drawCircle(){
        //使用自定义的UIView创建一个圆
        let cirle = circleView(frame: CGRect(x: 0, y: 0, width: 200, height:200 ))
        cirle.backgroundColor = UIColor.clear
        scrollView.addSubview(cirle)
    }

}

