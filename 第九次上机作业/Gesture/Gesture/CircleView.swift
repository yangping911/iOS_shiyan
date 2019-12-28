//
//  CircleView.swift
//  Gesture
//
//  Created by student on 2018/11/24.
//  Copyright © 2018年 student. All rights reserved.
//

import UIKit
@IBDesignable
class CircleView: UIView {

    @IBInspectable var fillcolor: UIColor?
    @IBInspectable var strokecolor: UIColor?
    
    func setup() {
        let panRecognizer = UIPanGestureRecognizer(target: self, action: #selector(pan(recognizer:)))
        self.addGestureRecognizer(panRecognizer)
        let pinchRecognizer = UIPanGestureRecognizer(target: self, action: #selector(pan(recognizer:)))
        self.addGestureRecognizer(pinchRecognizer)
    }
    
    @objc func pinch(recognizer: UIPinchGestureRecognizer){
        switch recognizer.state {
        case .changed:
            fallthrough
        case .ended:
            bounds.size = CGSize(width: bounds.width * recognizer.scale, height: bounds.height * recognizer.scale)
        default:
            break
        }
    }
    
    @objc func pan(recognizer: UIPanGestureRecognizer){
        switch recognizer.state {
        case .changed:
            fallthrough
        case .ended:
            let translation = recognizer.translation(in: self)
            center.x += translation.x
            center.y += translation.y
            recognizer.setTranslation(.zero, in: self)
        default:
            break
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
        let path = UIBezierPath(ovalIn: rect)
        UIColor.blue.setFill()
        fillcolor?.setFill()
        strokecolor?.setStroke()
        path.fill()
        path.stroke()
    }
 

}
