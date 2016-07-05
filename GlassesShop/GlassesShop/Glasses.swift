//
//  Glasses.swift
//  testEbalaApp
//
//  Created by Admin on 04.07.16.
//  Copyright © 2016 Admin. All rights reserved.
//

import UIKit

class Glasses: NSObject {
    
    var glass: Glass?
    var frame: Frame!
    var price: Price?
    var name: String!
    
    
    
    
    init(glass: Glass, frame: Frame, price: Price, name: String) {
        self.glass = glass
        self.frame = frame
        self.price = price
        self.name = name
    }
    
    init(glass: Glass, frame: Frame, name: String, description: String) {
        self.glass = glass
        self.frame = frame
        self.price = nil
        self.name = name
    }
    
}


