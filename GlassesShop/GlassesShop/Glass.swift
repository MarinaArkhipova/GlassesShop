//
//  Glass.swift
//  testEbalaApp
//
//  Created by Admin on 04.07.16.
//  Copyright © 2016 Admin. All rights reserved.
//

import UIKit

class Glass: NSObject {
    
    var color: UIColor?
    var size: CGSize
    var dioptries: Float?
    
    init (withColor color:UIColor, size:CGSize, andDeoptries deoptries: Float){
        self.color = color
        self.size = size
        self.dioptries = deoptries
    }
}


