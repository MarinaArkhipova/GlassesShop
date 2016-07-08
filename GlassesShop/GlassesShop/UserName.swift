//
//  UserName.swift
//  GlassesShop
//
//  Created by Marina on 07.07.16.
//  Copyright © 2016 Admin. All rights reserved.
//

import UIKit

class UserName: UIView {

    

    @IBOutlet weak var validationMessage: UILabel!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var textField: UITextField!
    
    
    var view: UIView!
    var nibName: String! = "UserName"
    var isValid: Bool!
    
    let kWrongSymbolsUserNameValidationMessage = "User name should contains only letters"
    let kWrongTextLengthUserNameValidationMessage = "Text length should be more than 2 and less than 30 symbols"
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    
    func setup() {
        
        loadView()
        
        self.title.text = "User name*"
        self.validationMessage.numberOfLines = 0
        self.validationMessage.adjustsFontSizeToFitWidth = true
        self.validationMessage.lineBreakMode = NSLineBreakMode.ByWordWrapping
        self.validationMessage.textColor = UIColor.redColor()
        self.validationMessage.font = self.validationMessage.font.fontWithSize(11.0)
        self.validationMessage.highlighted = true
        self.validationMessage.alpha = 0
        self.textField.keyboardType = UIKeyboardType.Alphabet
        self.textField.inputAccessoryView = self.createToolbar()
        self.isValid = false
    }


    func createToolbar()->UIToolbar {
        let toolBar = UIToolbar()
        toolBar.barStyle = UIBarStyle.Default
        toolBar.translucent = true
        toolBar.tintColor = UIColor(red: 76/255, green: 217/255, blue: 100/255, alpha: 1)
        let space = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.FlexibleSpace, target: nil, action: nil)
        let doneButton = UIBarButtonItem(title: "Done", style: UIBarButtonItemStyle.Done, target: self, action:Selector("toolBarDoneTouch:"))
        toolBar.setItems([space, doneButton], animated: false)

        toolBar.userInteractionEnabled = true
        toolBar.sizeToFit()

        return toolBar
    }


    func toolBarDoneTouch(sender: AnyObject)->Void {
        self.textField.resignFirstResponder()
    }
    
    func loadView() {
        view = self.loadViewFromNib()
        view.frame = self.bounds
        view.autoresizingMask = UIViewAutoresizing.FlexibleWidth
        addSubview(view)
    }
    
    private func loadViewFromNib() -> UIView {
        let bundle = NSBundle(forClass: self.dynamicType)
        let nib = UINib(nibName: nibName, bundle: bundle)
        let nibView = nib.instantiateWithOwner(self, options: nil).first as! UIView
        
        return nibView
    }
    
    @IBAction func textFieldEditingDidEnd(sender: AnyObject) {
        
        let charactersAvailable = self.checkIfUserNameCharactersAvailable()

        if (charactersAvailable && self.textField.text!.characters.count >= 2 && self.textField.text!.characters.count <= 30 ) {
            self.isValid = true
            UIView.animateWithDuration(0.8, delay: 0, options: UIViewAnimationOptions.TransitionCurlDown, animations: { () -> Void in
                self.validationMessage.alpha = 0
                }, completion: { (completed: Bool) -> Void in
                    self.validationMessage.hidden = true
            })
        }
        else {
            if (charactersAvailable) {
                self.validationMessage.text = kWrongTextLengthUserNameValidationMessage
            }
            else {
                self.validationMessage.text = kWrongSymbolsUserNameValidationMessage
            }
            self.isValid = false
            self.validationMessage.hidden = false
            UIView.animateWithDuration(0.8, animations: { () -> Void in
                self.validationMessage.alpha = 1
            })
        }
    }
    

    func checkIfUserNameCharactersAvailable() ->Bool {

        var isAvailable = true
        let availableCharacters : NSCharacterSet = NSCharacterSet.letterCharacterSet()

        for letter in (self.textField.text?.characters)! {
            let character = String(letter).unicodeScalars
            let uni = character[character.startIndex]
            if !availableCharacters.longCharacterIsMember(uni.value) {
                isAvailable = false
            }
        }
        return isAvailable
    }
   
    
    
}
