//
//  ViewController.swift
//  LogInApp3bySeneca
//
//  Created by Дмитрий Дмитрий on 01.12.2021.
//

import UIKit

class LogInViewController: UIViewController {

    @IBOutlet var userNameTF: UITextField!
    @IBOutlet var passwordTF: UITextField!
    
//    private let userName = "Dima"
//    private let password = "123"
    private let userInfo = User.getUserInfo()
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let tabBarVC = segue.destination as? UITabBarController else { return }
        guard let allOtherVC = tabBarVC.viewControllers else { return }
        
        for viewController in allOtherVC {
            if let welcomeVC = viewController as? WelcomeViewController {
                welcomeVC.welcomeName = userInfo.userName
            } else if let navigationVC = viewController as? UINavigationController {
                guard let userInfoVC = navigationVC.topViewController as? UserInfoViewController else { return }
                userInfoVC.userInfoName = userInfo.userName
            }
        }
    }
    
    @IBAction func LogInButtonPressed() {
        if userNameTF.text != userInfo.userName || passwordTF.text != userInfo.password {
            showAlert(
                title: "Wrong User Name or Password",
                message: "Enter correct User Name and Password"
            )
            return
        }
    }
    
    
    @IBAction func forgotUserDetailsAction(_ sender: UIButton) {
        sender.tag == 0
        ? showAlert(title: "Ooops", message: "Yr User Name is \(userInfo.userName)")
        : showAlert(title: "Ooops", message: "Yr Password is \(userInfo.password)")
    }
    
    @IBAction func unwindSegue(for segue: UIStoryboardSegue) {
        userNameTF.text = ""
        passwordTF.text = ""
    }

}

extension LogInViewController {
    private func showAlert(title: String, message: String) {
        let alert = UIAlertController(
            title: title,
            message: message,
            preferredStyle: .alert
        )
        let oKAction = UIAlertAction(
            title: "Ok",
            style: .default) { _ in
                self.userNameTF.text = ""
                self.passwordTF.text = ""
            }
        alert.addAction(oKAction)
        present(alert, animated: true)
    }
}

extension LogInViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == userNameTF {
            passwordTF.becomeFirstResponder()
        } else {
            LogInButtonPressed()
            performSegue(withIdentifier: "showWelcomVC", sender: nil)
        }
        return true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
}
