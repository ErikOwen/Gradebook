//
//  ViewController.swift
//  Gradebook
//
//  Created by Erik Owen on 5/5/15.
//  Copyright (c) 2015 Erik Owen. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBAction func loginButtonPressed(sender: AnyObject) {
        println("Test button pressed");
    }
    
    @IBAction func testButtonPressed(sender: AnyObject) {
        println("Test button pressed");
        usernameInput.text = "test";
        passwordInput.text = "sadf35cx90";
        
    }
    
    
    @IBOutlet weak var cpImage: UIImageView!
    
    @IBOutlet weak var usernameInput: UITextField!
    
    @IBOutlet weak var passwordInput: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        /*Sets the background image*/
        cpImage.image = UIImage(named: "cp_logo");
        
        /*Makes sure the password input is hidden*/
        passwordInput.secureTextEntry = true;
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }


}

