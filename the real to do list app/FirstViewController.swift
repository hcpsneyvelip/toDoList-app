//
//  FirstViewController.swift
//  the real to do list app
//
//  Created by Pranav Neyveli on 7/31/17.
//  Copyright © 2017 Pranav Neyveli. All rights reserved.
//

// we can expand by building a backend and making this app much more elegant to use. 
import UIKit
// always command click on the DataSource 

class FirstViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var table: UITableView!
   
    var item: [String] = []
    
    internal func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return item.count
    }
    

    // what is in te cells itself 
    internal func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // we keep as empty array
        
        let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "Cell")
        
        // this sets the items aray into the to do list app  and wrap with parenthesis to avoid the issues of optionals
        // this part important in general and can be used instead of other stuff as well doe !
        cell.textLabel?.text = item[indexPath.row]

        return cell
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewDidAppear(_ animated: Bool) {
        //lets it appear instantly
        
        let itemsObject = UserDefaults.standard.object(forKey: "items")
        //items variable empty to make it easier
        
        // if statement is used to sucessfully move on and we can set a new array that is entered in the text field  to be permenantly stored
        
        //create new aray store that
        
        
        if let tempItems = itemsObject as? [String] {
            
            item = tempItems
            
        }
        
        table.reloadData()
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == UITableViewCellEditingStyle.delete {
            
            item.remove(at: indexPath.row)
            // refreshes the upadated data
            table.reloadData()
            // calls foth the permenantly saved value
            UserDefaults.standard.set(item, forKey: "items")
            
        }
        
    }

    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

