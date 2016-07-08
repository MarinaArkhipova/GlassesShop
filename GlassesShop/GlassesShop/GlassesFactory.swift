//
//  GlassesFactory.swift
//  testEbalaApp
//
//  Created by Admin on 04.07.16.
//  Copyright © 2016 Admin. All rights reserved.
//

import UIKit

class GlassesFactory {
    
    static internal func createGlasses(quantity: Int) -> Array <Glasses> {
        var glasses:Array<Glasses> = []
        var counter: Int = 1
        while counter <= quantity {
            let glassesPair: Glasses = self.composeGlasses()
            let isSecond: Bool = (counter % 2 == 0)
            let discountType: GlassesType = self.configureGlasses(isSecond)
            glassesPair.price = self.configurePrice(accordingToDiscountType: discountType)
            glassesPair.name = "Ray Ben"
            glassesPair.image = UIImage(named: "1 glass")
            glasses.append(glassesPair)
            counter = counter + 1
        }
        return glasses
    }
    
    static func createGlass (color: UIColor, size: CGSize, dioptries: Float) -> Glass {
        return Glass.init(withColor: color, size: size, andDeoptries: dioptries)
    }
    
    static func createFrame (color: UIColor, shape: String, material: String) -> Frame {
        return Frame.init(withcolor: color, shape: shape, material: material)
    }
    
    static func composeGlasses() -> Glasses {
        let glassComponent: Glass = self.createGlass(UIColor.brownColor(), size: CGSizeMake(5, 3), dioptries: 0)
        let frameComponent: Frame = self.createFrame(UIColor.yellowColor(), shape: "Aviator", material: "Iron")
        return Glasses.init(glass: glassComponent, frame: frameComponent, name: "dfdf", description: "fdfdf", image: UIImage(named: "1 glass")!)
    }
    
    static func configureGlasses (everySecond: Bool) -> GlassesType {
        if everySecond == true {
            return GlassesType.totallyFree
        }
        return GlassesType.twentyPerCentsDiscont
    }
    
    static func configurePrice(accordingToDiscountType discountType: GlassesType) -> Price {
        switch discountType {
        case GlassesType.twentyPerCentsDiscont:
            return Price.init(amoun: 100, currency: "$", discount: 20)
        case GlassesType.totallyFree:
            return Price.init(amoun: 100, currency: "$", discount: 100)
        default:
            return Price.init(amount: 100, currency: "$")
            
        }
    }
}
