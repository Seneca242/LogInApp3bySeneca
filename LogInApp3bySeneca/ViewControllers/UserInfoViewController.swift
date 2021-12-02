//
//  UserInfoViewController.swift
//  LogInApp3bySeneca
//
//  Created by Дмитрий Дмитрий on 01.12.2021.
//

import UIKit

class UserInfoViewController: UIViewController {

    var userInfoName: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = userInfoName
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let imageVC = segue.destination as? ImageViewController else { return }
        imageVC.imageNameTitle = userInfoName
    }
    
}
