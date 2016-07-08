//
//  Price.swift
//  testEbalaApp
//
//  Created by Admin on 03.07.16.
//  Copyright © 2016 Admin. All rights reserved.
//

import UIKit

class Price: NSObject {
    var amout: Double
    var currency: String
    var discount: Int
    
    init (amount: Double, currency: String)  {
        self.amout = amount
        self.currency = currency
        self.discount = 0
        
    }
    init(amoun: Double,currency: String, discount: Int) {
        self.amout = amoun
        self.currency = currency
        self.discount = discount
    }
    
    
    func calculateDiscount() -> String {
        var actualPrice: Double = 0
        if (self.discount != 0) {
            let k0: Double  = (Double(self.discount)/100.0)
            actualPrice = self.amout - (self.amout * k0)
        }
        
        return String(actualPrice)
    }

}


enum GlassesType : String {
    case totallyFree
    case twentyPerCentsDiscont
    case withoutDiscount
}
