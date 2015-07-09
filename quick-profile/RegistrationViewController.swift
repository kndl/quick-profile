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
    
    var profile : Profile!
    
    @IBOutlet weak var passwordLabel: UILabel!
    @IBOutlet weak var confirmPasswordLabel: UILabel!
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var confirmPasswordTextField: UITextField!
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!

    @IBOutlet weak var button: UIButton!
    
    // MARK: Les Initializers
    
    convenience init(profile: Profile) {
        self.init(nibName: nil, bundle: nil)
        self.profile = profile
        self.title = "Edit Profile"
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Logout", style: UIBarButtonItemStyle.Plain, target: self, action: "logout:")
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        self.title = "Sign Up"
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Le Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: Le Management Des Views
    
    func configureView() {
        if (isEditProfile()) {
            passwordTextField.removeFromSuperview()
            confirmPasswordTextField.removeFromSuperview()
            passwordLabel.removeFromSuperview()
            confirmPasswordLabel.removeFromSuperview()
            button.setTitle("Save", forState: UIControlState.Normal)
            
            usernameTextField.text = profile.username
            firstNameTextField.text = profile.firstName
            lastNameTextField.text = profile.lastName
        }
    }
    
    func emptyFields() {
        usernameTextField.text = ""
        passwordTextField.text = ""
        confirmPasswordTextField.text = ""
        firstNameTextField.text = ""
        lastNameTextField.text = ""
    }
    
    func isEditProfile() -> Bool {
        return profile != nil
    }

    // MARK: Les Actions
    
    @IBAction func buttonTapped(sender: AnyObject) {
        if isEditProfile() {
            saveProfile()
        } else {
            signUp()
        }
    }
    
    func signUp() {
        let profile = Profile(username: usernameTextField.text,
            password: passwordTextField.text,
            firstName: firstNameTextField.text,
            lastName: lastNameTextField.text
        )
        
        if (passwordsMatch() && profile.valid()) {
            navigateToProfile(profile)
        } else {
            let alertController = UIAlertController(title: "Error", message: "Password must match, and username and password must not be blank.", preferredStyle: UIAlertControllerStyle.Alert)
            alertController.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
            presentViewController(alertController, animated: true, completion: nil)
        }
    }
    
    func saveProfile() {
        profile.username = usernameTextField.text
        profile.firstName = firstNameTextField.text
        profile.lastName = lastNameTextField.text
        if (profile.valid()) {
            self.dismissViewControllerAnimated(true, completion: nil)
        } else {
            let alertController = UIAlertController(title: "Error", message: "Username must not be blank", preferredStyle: UIAlertControllerStyle.Alert)
            alertController.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
            presentViewController(alertController, animated: true, completion: nil)
        }
    }
    
    func passwordsMatch() -> Bool {
        return passwordTextField.text == confirmPasswordTextField.text || self.isEditProfile()
    }
    
    func navigateToProfile(profile: Profile) {
        let controller = ProfileViewController(profile: profile)
        navigationController?.pushViewController(controller, animated: true)
        emptyFields()
    }
    
    func logout(sender: AnyObject) {
        let presentingNavController = navigationController?.presentingViewController as? UINavigationController
        presentingNavController!.popToRootViewControllerAnimated(false)
        navigationController?.dismissViewControllerAnimated(true, completion: nil)
    }
}
