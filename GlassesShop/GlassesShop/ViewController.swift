//
//  ViewController.swift
//  testEbalaApp
//
//  Created by Admin on 03.07.16.
//  Copyright © 2016 Admin. All rights reserved.
//

import UIKit



class ViewController: UITableViewController {
    
    var glasses: Array<Glasses>?
    
    
    // MARK: LyfeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        glasses = GlassesFactory.createGlasses(15)
    }
    
    
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (glasses?.count)!;
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = CustomTableViewCell.init(style:UITableViewCellStyle(rawValue: 1)! , reuseIdentifier: "reuseID")
        
        let qnttDoesntMismatch: Bool = (indexPath.row < glasses?.count);
        if (qnttDoesntMismatch) {
            let currentGlasses: Glasses = glasses![indexPath.row]
            cell.configureCell(withTitle: "Ray Ben", andPrice: currentGlasses.price!)
        }
        
        return cell
    }
    
}

