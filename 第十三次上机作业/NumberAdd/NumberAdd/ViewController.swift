//
//  ViewController.swift
//  NumberAdd
//
//  Created by student on 2018/12/17.
//  Copyright © 2018年 wuxixi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var sumLable: UILabel!
    @IBOutlet weak var countLable: UILabel!
    var count = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { (timer) in
            self.count += 1
            print("Timer Thread;\(Thread.current)")
            self.countLable.text = "\(self.count)"
        }
    }
    
    @IBAction func sum(_ sender: Any) {
        var sum = 0
        DispatchQueue.global().async {
            print("Sum Thread;\(Thread.current)")
            for i in 1...9999999{
                sum += i
            }
            DispatchQueue.main.async {
                self.sumLable.text = "\(sum)"
                
            }
        }
        
    }
    
}
