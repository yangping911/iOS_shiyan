//
//  ViewController.swift
//  MultiMVC
//
//  Created by student on 2018/12/15.
//  Copyright © 2018年 2016110340. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {
    func change(name: String, no: String) {
        self.name = name
        self.no = no
    }
    
    var name = ""
    var no = ""
    
    @IBOutlet weak var tfNO: UITextField!
    @IBOutlet weak var tfName: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tfNO.text = no
        tfName.text = name
    }
    @IBAction func showSecondVC(_ sender: Any) {
        no = tfNO.text!
        name = tfName.text!
        //let secVC = SecondViewController( )
        let secVC = UIStoryboard(name:"Main" ,bundle: nil).instantiateViewController(withIdentifier: "SecondVC") as! SecondViewController
        
        secVC.no = no
        secVC.name = name
        //present(secVC, animated: true,completion: nil)
        self.navigationController?.pushViewController(secVC, animated: true)
    }
    @IBAction func showThirdVC(_ sender: Any) {
        let thirdVC = UIStoryboard(name:"Main" ,bundle :nil).instantiateViewController(withIdentifier: "ThirdVC")
        present(thirdVC, animated: true,completion: nil)
    }


}

