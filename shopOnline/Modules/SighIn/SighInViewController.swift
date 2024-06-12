//
//  SighInViewController.swift
//  shopOnline
//
//  Created by Vladimir Liubarskiy on 04/06/2024.
//

import UIKit

class SighInViewController: UIViewController {
    
    
    @IBOutlet
    var logInButton: UIButton!
    
    @IBOutlet
    var emailTextField: UITextField!
    
    @IBOutlet
    var passwordTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    private func configure() {
        logInButton.layer.cornerRadius = 10
        emailTextField.text = "admin@gmail.com"
    }
    
    @IBAction func forgotButtonDidTapped(_ sender: Any) {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        guard  let controller = storyBoard.instantiateViewController(withIdentifier: "RestoreWithEmailViewController") as? RestoreWithEmailViewController else {
            return
        }
        controller.tempEmail = emailTextField.text
        navigationController?.pushViewController(controller, animated: true)
    }
    
    @IBAction func logInButtonDidTapped(_ sender: Any) {
        guard let email = emailTextField.text, !email.isEmpty else {
            alert(text: "Ooops!", description: "Please enter your email")
            return
        }
        guard let password = passwordTextField.text, !password.isEmpty else {
            alert(text: "Ooops!", description: "Please enter your password")
            return
        }
        if let user = AuthService.shared.login(email: email, password: password) {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let controller = storyboard.instantiateViewController(identifier: "RootModule")
            controller.modalPresentationStyle = .fullScreen
            present(controller, animated: true)
        } else {
            alert(text: "Ooops!", description: "User not found")
        }
    }
    
    
}
