//
//  SignUpViewController.swift
//  EUTour
//
//  Created by Nan on 14/8/13.
//  Copyright (c) 2014年 Nan. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController, UITextFieldDelegate {

    // MARK: Properties
    
    @IBOutlet weak var username: UITextField!
    
    @IBOutlet weak var email: UITextField!
    
    @IBOutlet weak var password: UITextField!
    
    @IBAction func username_DidEndOnExit(sender: AnyObject) {
        email.becomeFirstResponder()
    }
    
    @IBAction func email_DidEndOnExit(sender: AnyObject) {
        password.becomeFirstResponder()
    }
    
    @IBAction func password_DidEndOnExit(sender: AnyObject) {
        sender.resignFirstResponder()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        username.becomeFirstResponder()
        configureUsername()
        
    }

    func configureUsername() {
        username.placeholder = NSLocalizedString("昵称", comment: "")
        username.autocorrectionType = .Yes
        username.returnKeyType = .Next
        username.clearButtonMode = .Never
    }
    
    /*
    override func touchesBegan(touches: NSSet!, withEvent event: UIEvent!) {
        username.resignFirstResponder()
        email.resignFirstResponder()
        password.resignFirstResponder()
    }
    */
    
    /*
    func textFieldShouldReturn(textField: UITextField!) -> Bool {
        textField.resignFirstResponder()
        
        return true
    }
    */

}
