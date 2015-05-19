//
//  ViewController.swift
//  Gradebook
//
//  Created by Erik Owen on 5/5/15.
//  Copyright (c) 2015 Erik Owen. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    var loader: GradebookURLLoader?
    
    @IBAction func loginButtonPressed(sender: AnyObject) {
        println("Login button pressed");
    }
    
    @IBAction func testButtonPressed(sender: AnyObject) {
        println("Test button pressed");
        usernameInput.text = "test";
        passwordInput.text = "sadf35cx90";
        baseUrlInput.text = "https://users.csc.calpoly.edu/~bellardo/cgi-bin/test/grades.json";
        
    }
    
    
    @IBOutlet weak var cpImage: UIImageView!
    
    @IBOutlet weak var usernameInput: UITextField!
    
    @IBOutlet weak var passwordInput: UITextField!
    
    @IBOutlet weak var baseUrlInput: UITextField!
    
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

