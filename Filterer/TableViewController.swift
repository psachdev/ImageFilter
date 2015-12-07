//
//  TableViewController.swift
//  Filterer
//
//  Created by Prateek Sachdeva on 12/2/15.
//  Copyright (c) 2015 Prateek. All rights reserved.
//

import UIKit

class TableViewController: UIViewController , UITableViewDataSource, UITableViewDelegate {
    @IBOutlet var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource=self
        tableView.delegate=self
    }
    
    func tableView(tableView: UITableView, didDeselectRowAtIndexPath indexPath: NSIndexPath) {
        print(filters[indexPath.row])
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    let filters = [
        "Red",
        "Blue",
        "Green",
        "Yellow",
        "Red",
        "Blue",
        "Green",
        "Yellow",
        "Red",
        "Blue",
        "Green",
        "Yellow",
        "Red",
        "Blue",
        "Green",
        "Yellow",
        "Red",
        "Blue",
        "Green",
        "Yellow",
        "Red",
        "Blue",
        "Green",
        "Yellow"
    ]
    
    
    //Delegate method to retrieve number of rows in table
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filters.count
    }
    
    //Return the cell for a given index
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell: AnyObject = tableView.dequeueReusableCellWithIdentifier("FilterCell", forIndexPath: indexPath)
        
        cell.textLabel?!.text = filters[indexPath.row]
        return cell as! UITableViewCell
    }
    
    
}
