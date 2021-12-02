//
//  WelcomeViewController.swift
//  LogInApp3bySeneca
//
//  Created by Дмитрий Дмитрий on 01.12.2021.
//

import UIKit

class WelcomeViewController: UIViewController {

    @IBOutlet var welcomeLabel: UILabel!
    
    var welcomeName = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        welcomeLabel.text = "Welcome, \(welcomeName)!"
    }
    

}
