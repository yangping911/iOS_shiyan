//
//  ViewController.swift
//  HelloWorld
//
//  Created by student on 2018/12/15.
//  Copyright © 2018年 2016110340. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        view.backgroundColor = UIColor.brown
        
        let label = UILabel(frame: CGRect(x: 200, y: 400, width: 200, height: 50))
        label.text = "Hello World!"
        label.backgroundColor = UIColor.yellow
        label.textAlignment = .center
        label.center = view.center
        view.addSubview(label)
        
        let button = UIButton(frame: CGRect(x: 100, y: 100, width: 200, height: 20))
        button.setTitle("Click Me", for: .normal)
       
        button.setTitleColor(UIColor.red, for: .normal)
        view.addSubview(button)
        
        button.addTarget(self, action: #selector(btnClicked), for: .touchUpInside)
        
        self.title = "first"
        print("viewdidload")
    }
    
    @IBAction func btnClicked() {
        if let label = view.subviews.first as? UILabel {
            label.text = "I am Clicked!"
        }
       // self.navigationController?.pushViewController(SecondViewController(), animated: true)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        print("viewWillAppear")
    }
    override func viewWillDisappear(_ animated: Bool) {
        print("viewWillDisappear")
    }
}


