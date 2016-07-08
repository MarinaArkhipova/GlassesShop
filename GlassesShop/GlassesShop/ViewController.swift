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
    var cellIsSelected: Bool?
    var cellIndex: NSIndexPath?
    
    override init(style: UITableViewStyle) {
        super.init(style: UITableViewStyle.Plain)
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        glasses = GlassesFactory.createGlasses(15)
        cellIsSelected = false
        cellIndex = NSIndexPath(forRow: 0, inSection: 0)
        self.tableView.separatorStyle = UITableViewCellSeparatorStyle.None
    }
    
    
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if (cellIsSelected == true) {
            return (glasses?.count)! + 1
            
    
        }
        return (glasses?.count)!;
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        if  (indexPath.row == self.cellIndex!.row && indexPath.section == cellIndex?.section && cellIsSelected == true) {
            
            let cell = UITableViewCell.init(style:UITableViewCellStyle(rawValue: 1)! , reuseIdentifier: "reuseID")
            return cell
        }
        else {
        
            let cell = CustomTableViewCell.init(style:UITableViewCellStyle(rawValue: 1)! , reuseIdentifier: "reuseID")
            
            let qnttDoesntMismatch: Bool = (indexPath.row < glasses?.count);
            if (qnttDoesntMismatch) {
                let currentGlasses: Glasses = glasses![indexPath.row]
                cell.configureCell(withTitle: currentGlasses.name, andPrice: currentGlasses.price!, andImage: currentGlasses.image)
                
                cell.layer.borderWidth = 0.9;
                
                cell.layer.borderColor = UIColor.grayColor().CGColor
                
                cell.layer.cornerRadius = 9
                view.layer.borderWidth = 1
                view.layer.borderColor = UIColor.yellowColor().CGColor
                
        
            }
        return cell
    }
}
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 60
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        if cellIsSelected == false {
            cellIsSelected = true
            cellIndex = NSIndexPath(forRow: indexPath.row + 1, inSection: indexPath.section)
            tableView.insertRowsAtIndexPaths([cellIndex!], withRowAnimation: .Automatic)
        }
        else {
            cellIsSelected = false
            tableView.deleteRowsAtIndexPaths([cellIndex!], withRowAnimation: .Automatic)
            // удаляем ячейку с индексом cellSelectedIndex
        
        }
        
        
    }
    
}

