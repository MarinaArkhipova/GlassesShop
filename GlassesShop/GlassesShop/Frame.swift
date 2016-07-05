//
//  Frame.swift
//  testEbalaApp
//
//  Created by Admin on 04.07.16.
//  Copyright © 2016 Admin. All rights reserved.
//

import UIKit

class Frame: NSObject {
    var color: UIColor
    var shape: String
    var material: String
    
    init(withcolor color:UIColor, shape: String, material: String) {
        self.color = color
        self.shape = shape
        self.material = material
        
    }
    
    
}
