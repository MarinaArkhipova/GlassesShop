//
//  DataMapper.swift
//  GlassesShop
//
//  Created by Marina on 08.07.16.
//  Copyright © 2016 Admin. All rights reserved.
//

import UIKit

class DataMapper: NSObject {

    var data: NSMutableArray?
    
    override init() {
        super.init()
        data = NSMutableArray()
        loadData()
    }
    
    func loadData() -> Void {
        
        var myDict: NSArray?
        if let path = NSBundle.mainBundle().pathForResource("data", ofType: "plist") {
            myDict = NSArray(contentsOfFile: path)
        }
        
        if let dict = myDict {
            
            for item in dict {
                
                let values: NSArray = item as! NSArray
                assert(values.count == 6)
                
                let glassesData: GlassesData = GlassesData()
                
                let imageName = values[0] as! NSString
                if (imageName.length > 0) {
                    
                    let i: String = String(imageName)
                    let image = UIImage(named: i)
                    glassesData.image = image
                }
                
                glassesData.name = values[1] as? String
                
                let amount = values[2] as? Int
                let currency = values[3] as? String
                let discount = values[4] as? Int
                
                let price = Price(amoun: Double(amount!), currency: currency!, discount: discount!)
                glassesData.price = price
                
                glassesData.descr = values[5] as? String
                
                data?.addObject(glassesData)
                
            }
        }
    }
    
    
    func getLoadedData() ->NSMutableArray {
        return data!
    }
    
    
}
