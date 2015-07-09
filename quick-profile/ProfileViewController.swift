//
//  ProfileViewController.swift
//  quick-profile
//
//  Created by Kendall Aubertot on 7/9/15.
//  Copyright (c) 2015 kndl. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {
    override var nibName : String {
        get {
            return "ProfileViewController"
        }
    }
    
    var profile: Profile! {
        didSet {
            updateLabels()
        }
    }

    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var firstNameLable: UILabel!
    @IBOutlet weak var lastNameLabel: UILabel!
    
    // MARK: Le Initialization
    
    convenience init(profile: Profile!) {
        self.init(nibName: nil, bundle: nil)
        self.profile = profile
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        self.title = "Profile"
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Edit, target: self, action: "editProfile:")
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Le Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        updateLabels()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(true)
        updateLabels()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: Les Helpers
    
    func updateLabels() {
        usernameLabel.text = profile.username
        firstNameLable.text = profile.firstName
        lastNameLabel.text = profile.lastName
    }
    
    // MARK: Les Actions
    
    func editProfile(sender: AnyObject) {
        let controller = RegistrationViewController(profile: profile)
        let editNavController = UINavigationController(rootViewController: controller)
        navigationController?.presentViewController(editNavController, animated: true, completion: nil)
    }
}
