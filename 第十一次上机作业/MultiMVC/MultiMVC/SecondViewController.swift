//
//  SecondViewController.swift
//  MultiMVC
//
//  Created by student on 2018/12/15.
//  Copyright © 2018年 2016110340. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    var name = ""
    var no = ""
    
    @IBOutlet weak var tfNO: UITextField!
    @IBOutlet weak var tfName: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        tfNO.text = no
        tfName.text = name
        // Do any additional setup after loading the view.
    }
   
    @IBAction func back(_ sender: Any) {
        //dismiss(animated: true, completion: nil)
        no = tfNO.text!
        name = tfName.text!
        
        navigationController?.popViewController(animated: true)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
