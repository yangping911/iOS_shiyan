//
//  detailViewController.swift
//  coredate-12.2
//
//  Created by student on 2018/12/6.
//  Copyright © 2018年 2016. All rights reserved.
//

import UIKit

class detailViewController: UIViewController {

    var person:Person?
    
    @IBOutlet weak var tfpassword: UILabel!
    @IBOutlet weak var tfname: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        tfname.text=person?.name
        tfpassword.text=person?.password
        // Do any additional setup after loading the view.
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
