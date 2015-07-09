//
//  ViewController.swift
//  quick-profile
//
//  Created by Kendall Aubertot on 7/9/15.
//  Copyright (c) 2015 kndl. All rights reserved.
//

import UIKit

class RegistrationViewController: UIViewController {
    override var nibName : String {
        get {
            return "RegistrationViewController"
        }
    }
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var confirmPasswordTextField: UITextField!
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func signUpTapped(sender: AnyObject) {
        let profile = Profile(username: usernameTextField.text,
                    password: passwordTextField.text,
                    firstName: firstNameTextField.text,
                    lastName: lastNameTextField.text
        )
        
        if (passwordsMatch() && profile.valid()) {
            signUp(profile)
        }
    }
    
    func passwordsMatch() -> Bool {
        return passwordTextField.text == confirmPasswordTextField.text
    }
    
    func signUp(profile : Profile) {

    }
    
}

