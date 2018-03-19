//
//  SecondViewController.swift
//  the real to do list app
//
//  Created by Pranav Neyveli on 7/31/17.
//  Copyright © 2017 Pranav Neyveli. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    @IBOutlet var itemField: UITextField!

    @IBAction func addButton(_ sender: Any) {

        
        //items variable empty to make it easier and store permenantly in this data to use it later

        let itemsObject = UserDefaults.standard.object(forKey: "items")
        
        //create new variable that stores that
        
        var item:[String] = []
        
        // if statement is used to sucessfully move on and we can set a new array that is entered in the text field  to be permenantly stored

        
        if let tempItems = itemsObject as? String {
            
            item = [tempItems]
            item.append(itemField.text!)
            
            print(item)
            
        } else {
            
            item = [itemField.text!]
            
        }
        
        UserDefaults.standard.set(item, forKey: "items")
        
        itemField.text = ""

        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

