//
//  ViewController.swift
//  coredate-12.2
//
//  Created by student on 2018/12/6.
//  Copyright © 2018年 2016. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    @IBOutlet weak var tfname: UITextField!
    @IBOutlet weak var tfpassword: UITextField!
    
    let appdategate = UIApplication.shared.delegate as!AppDelegate
    let context=(UIApplication.shared.delegate as!AppDelegate).persistentContainer.viewContext
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    @IBAction func cancel(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func add(_ sender: Any) {
        let person=Person(context: context)
        person.name=tfname.text
        person.password=tfpassword.text
        appdategate.saveContext()
        dismiss(animated: true, completion: nil)
    }
//
//    @IBAction func update(_ sender: Any) {
//        let fetch:NSFetchRequest<Person>=Person.fetchRequest()
//        fetch.predicate=NSPredicate(format: "name=%@", tfname.text!)
//        let persons=try? context.fetch(fetch)
//        if let person=persons?.first{
//            person.password=tfpassword.text
//            appdategate.saveContext()
//        }
//    }
//
//    @IBAction func del(_ sender: Any) {
//        let fetch:NSFetchRequest<Person>=Person.fetchRequest()
//        fetch.predicate=NSPredicate(format: "name=%@", tfname.text!)
//        let persons=try? context.fetch(fetch)
//        if let person=persons?.first{
//            context.delete(person)
//            appdategate.saveContext()
//        }
//    }
//
//    @IBAction func query(_ sender: Any) {
//        let fetch:NSFetchRequest<Person>=Person.fetchRequest()
//        fetch.predicate=NSPredicate(format: "name=%@", tfname.text!)
//        let persons=try? context.fetch(fetch)
//        if let person=persons?.first{
//            tfpassword.text=person.password
//        }
//    }
}

