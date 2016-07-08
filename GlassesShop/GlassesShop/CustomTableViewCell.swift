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
    var newPriceLabel: UILabel?
    var oldPriceLabel: UILabel?
    var name: UILabel?
    var picture: UIImageView?
    
    
    func configureSubviews() {
        self.titleLabel = UILabel.init()
        self.contentView.addSubview(self.titleLabel!)
        self.newPriceLabel = UILabel.init()
        self.contentView.addSubview(self.newPriceLabel!)
        self.oldPriceLabel = UILabel.init()
        self.contentView.addSubview(self.oldPriceLabel!)
        self.name = UILabel.init()
        self.contentView.addSubview(self.name!)
    }
    
    
    func configureCell(withTitle title: String, andPrice price: Price, andImage image: UIImage) {
        self.titleLabel?.text = title
        self.newPriceLabel?.text =  price.calculateDiscount()
        if (price.discount > 0) {
            self.oldPriceLabel?.text = String(price.amout) + " " + price.currency
        } else {
            self.oldPriceLabel?.text = nil;
        }
        
        self.picture = UIImageView(image: image)
        self.contentView.addSubview(self.picture!)
        self.setNeedsLayout()
        
        //set font size for price
        self.newPriceLabel?.font = oldPriceLabel!.font.fontWithSize(12)
        self.oldPriceLabel?.font = newPriceLabel!.font.fontWithSize(12)
        
        let attributeString: NSMutableAttributedString =  NSMutableAttributedString(string: (self.oldPriceLabel?.text)!)
        
        attributeString.addAttribute(NSStrikethroughStyleAttributeName, value: 2, range: NSMakeRange(0, attributeString.length))
        self.oldPriceLabel?.attributedText = attributeString
    }
    

    
    override func layoutSubviews() {
        
        //ger size of picture
        
        let imageWidth: CGFloat = (self.picture?.image?.size.width)!/4
        let imageHeight: CGFloat = (self.picture?.image?.size.height)!/4
        let yOffset: CGFloat = (self.bounds.size.height - imageHeight)/4
        self.picture?.frame = CGRectMake(0, yOffset, imageWidth,imageHeight)
        
        //get size of price
        let newPriceLabelSize: CGSize = (self.newPriceLabel?.sizeThatFits(CGSizeMake(CGFloat.max, CGFloat.max)))!
        //get size of sale price
        let oldPriceLabelSize: CGSize = (self.oldPriceLabel?.sizeThatFits(CGSizeMake(CGFloat.max, CGFloat.max)))!
        
        
        
       
        
        

        //get cell width
        //let bounds = UIScreen.mainScreen().bounds
        //let screenWidth = bounds.size.width
        
        let w = self.bounds.size.width
    

        //get right position
        
        let rightPositionPrice = w - newPriceLabelSize.width - 10
        let rightPositionActualPrice = w - oldPriceLabelSize.width - 10
        
        let maxPriceWidth = max(newPriceLabelSize.width, oldPriceLabelSize.width)
        
        let rightPositionTitle = w  - imageWidth - maxPriceWidth
        
        self.newPriceLabel?.frame = CGRectMake(rightPositionPrice, 15, newPriceLabelSize.width, newPriceLabelSize.height)
        
        self.oldPriceLabel?.frame = CGRectMake(rightPositionActualPrice, 25, oldPriceLabelSize.width, oldPriceLabelSize.height)
        
        
        
        // title
        let titleSize: CGSize = (self.titleLabel?.sizeThatFits(CGSizeMake(CGFloat.max, CGFloat.max)))!
        let leftIdent :CGFloat = imageWidth + 5
        self.titleLabel?.frame = CGRectMake(leftIdent ,25, rightPositionTitle, titleSize.height)
        
        
        
        
        
        
        
        
        
        
        //get right position
        //let rightPositionPrice = screenWidth - newPriceLabelSize.width - 10
        //let rightPositionActualPrice = screenWidth - oldPriceLabelSize.width - 10
        //let rightPositionTittle = screenWidth - titleViewSize.width - 95
        
    
        //self.newPriceLabel?.frame = CGRectMake(rightPositionPrice, 15, newPriceLabelSize.width, newPriceLabelSize.height)
        
        //self.oldPriceLabel?.frame = CGRectMake(rightPositionActualPrice, 25, oldPriceLabelSize.width, oldPriceLabelSize.height)
        
        //self.titleLabel?.frame = CGRectMake(rightPositionTittle,25, titleViewSize.width, titleViewSize.height)
    
        
        //size and position of name
        
        
        
        //let titleViewSize: CGSize = (self.titleLabel?.sizeThatFits(CGSizeMake(CGFloat.max, CGFloat.max)))!
        //self.titleLabel?.frame = CGRectMake(10, 20, titleViewSize.width, titleViewSize.height)
        
        // let rightPositionPicture = screenWidth - pictureViewSize.width - 90
        
//         self.picture?.frame = CGRectMake(0, 25, pictureViewSize.width, pictureViewSize.height)
        
        
    }
}
    
