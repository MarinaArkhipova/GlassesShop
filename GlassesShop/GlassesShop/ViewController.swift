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
    var data: NSMutableArray?
    var dataMapper: DataMapper?
    
    
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
        view.layer.borderWidth = 1
        dataMapper = DataMapper.init()
        data = dataMapper!.getLoadedData()
        self.view.backgroundColor = UIColor(red: 255.0/255.0, green: 239.0/255.0, blue: 82.0/255.0, alpha: 1.0)
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if (cellIsSelected == true) {
            return data!.count + 1
        }
        return data!.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        if  (indexPath.row == self.cellIndex!.row && indexPath.section == cellIndex?.section && cellIsSelected == true) {
            
            let cell = UITableViewCell.init(style:UITableViewCellStyle(rawValue: 1)! , reuseIdentifier: "reuseID")
            return cell
        }
        else {
        
            let cell = CustomTableViewCell.init(style:UITableViewCellStyle(rawValue: 1)! , reuseIdentifier: "reuseID")
            
            let qnttDoesntMismatch: Bool = (indexPath.row < data!.count);
            
            if (qnttDoesntMismatch) {
                
                let currentGlasses: GlassesData = data![indexPath.row] as! GlassesData
                cell.configureCell(withTitle: currentGlasses.name!, andPrice: currentGlasses.price!, andImage: currentGlasses.image!)
                
                cell.layer.borderWidth = 0.9;
                cell.layer.borderColor = UIColor(red: 255.0/255.0, green: 239.0/255.0, blue: 82.0/255.0, alpha: 1.0).CGColor
                cell.layer.cornerRadius = 9

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
            if (((cellIndex?.row)! - 1) == indexPath.row && cellIndex?.section == indexPath.section) {
                cellIsSelected = false
                tableView.deleteRowsAtIndexPaths([cellIndex!], withRowAnimation: .Automatic)
            }
            else {
                
                if ((cellIndex?.row)! != indexPath.row && cellIndex!.section != indexPath.section) {
                    cellIsSelected = true
                    
                    tableView.beginUpdates()
                    
                    tableView.deleteRowsAtIndexPaths([cellIndex!], withRowAnimation: .Automatic)
                    cellIndex = indexPath
                    tableView.insertRowsAtIndexPaths([cellIndex!], withRowAnimation: .Automatic)
                    
                    tableView.endUpdates()
                }
            }
            
            // удаляем ячейку с индексом cellSelectedIndex
        
        }
        
        
    }
    
}

