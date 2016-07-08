//
//  RegistrationViewController.swift
//  GlassesShop
//
//  Created by Marina on 05.07.16.
//  Copyright © 2016 Admin. All rights reserved.
//

import UIKit



class RegistrationViewController: UIViewController {

    @IBOutlet weak var registrationButton: UIButton!

    @IBOutlet weak var userName: UserName!
    @IBOutlet weak var phoneNumber: PhoneNumber!
    
    @IBAction func registerButtonTapped(sender: AnyObject) {
        
        if (userName.isValid == true && phoneNumber.isValid == true) {
           
            dispatch_async(dispatch_get_main_queue()){
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                let vc : UIViewController = storyboard.instantiateViewControllerWithIdentifier("ViewController") as! ViewController
                self.navigationController?.pushViewController(vc, animated: true)
            }
        }
        
    }
    
    
    
}
