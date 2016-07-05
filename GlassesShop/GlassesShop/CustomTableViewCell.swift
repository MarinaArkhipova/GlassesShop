//
//  CustomTableViewCell.swift
//  testEbalaApp
//
//  Created by Admin on 03.07.16.
//  Copyright © 2016 Admin. All rights reserved.
//

import UIKit


class CustomTableViewCell: UITableViewCell {
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.configureSubviews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    var titleLabel: UILabel?
    var rowPriceLabel: UILabel?
    var actualPriceLabel: UILabel?
    
    
    func configureSubviews() {
        self.titleLabel = UILabel.init()
        self.contentView.addSubview(self.titleLabel!)
        self.rowPriceLabel = UILabel.init()
        self.contentView.addSubview(self.rowPriceLabel!)
        self.actualPriceLabel = UILabel.init()
        self.contentView.addSubview(self.actualPriceLabel!)
    }
    
    
    func configureCell(withTitle title: String, andPrice price: Price) {
        self.titleLabel?.text = title
        self.rowPriceLabel?.text =  String(price.amout) + " " + price.currency
        if (price.discount > 0) {
            self.actualPriceLabel?.text = self.calculateDiscount(withPrice: price) + " " + price.currency
        } else {
            self.actualPriceLabel?.text = nil;
        }
        self.setNeedsLayout()
        
        //set font size for price
        self.rowPriceLabel?.font = rowPriceLabel!.font.fontWithSize(10)
        self.actualPriceLabel?.font = actualPriceLabel!.font.fontWithSize(10)
    }
    
    
    func calculateDiscount(withPrice price: Price) -> String {
        var actualPrice: Double = 0
        if (price.discount != 0) {
            let k0: Double  = (Double(price.discount)/100.0)
            actualPrice = price.amout - (price.amout * k0)
        }
        
        return String(actualPrice)
    }
    
    override func layoutSubviews() {
        //size and position of name
        let titleViewSize: CGSize = (self.titleLabel?.sizeThatFits(CGSizeMake(CGFloat.max, CGFloat.max)))!
        self.titleLabel?.frame = CGRectMake(10, 20, titleViewSize.width, titleViewSize.height)
        
        //get size of price
        let rowPriceLabelSize: CGSize = (self.rowPriceLabel?.sizeThatFits(CGSizeMake(CGFloat.max, CGFloat.max)))!
        //get size of sale price
        let actualPriceLabelSize: CGSize = (self.actualPriceLabel?.sizeThatFits(CGSizeMake(CGFloat.max, CGFloat.max)))!
        
        //get screen width
        let bounds = UIScreen.mainScreen().bounds
        let screenWidth = bounds.size.width
        
        //get right position
        let rightPositionPrice = screenWidth - rowPriceLabelSize.width - 10
        let rightPositionActualPrice = screenWidth - actualPriceLabelSize.width - 10
        
        
        self.rowPriceLabel?.frame = CGRectMake(rightPositionPrice, 15, rowPriceLabelSize.width, rowPriceLabelSize.height)
        
        self.actualPriceLabel?.frame = CGRectMake(rightPositionActualPrice, 25, actualPriceLabelSize.width, actualPriceLabelSize.height)
    }
    
    
    
}