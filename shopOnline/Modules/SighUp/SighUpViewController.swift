//
//  SighUpViewController.swift
//  shopOnline
//
//  Created by Vladimir Liubarskiy on 04/06/2024.
//

import UIKit

class SighUpViewController: UIViewController {
    
    
    @IBOutlet
    var nameTextField: UITextField!
    
    @IBOutlet
    var surnameTextField: UITextField!
    
    @IBOutlet 
    var emailTextField: UITextField!
    
    @IBOutlet
    var passwordTextField: UITextField!
    
    @IBOutlet
    var confirmTextField: UITextField!
    
    @IBOutlet 
    var sighInButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    private func configure() {
        sighInButton.layer.cornerRadius = 10
    }
    
    @IBAction func sighInButtonDidTapped(_ sender: Any) {
        guard let name = nameTextField.text, !name.isEmpty else {
            alert(text: "Ooops!", description: "Please enter your name")
            return
        }
        guard let surname = surnameTextField.text, !surname.isEmpty else {
            alert(text: "Ooops!", description: "Please enter your surname")
            return
        }
        guard let email = emailTextField.text, !email.isEmpty else {
            alert(text: "Ooops!", description: "Please enter your email")
            return
        }
        guard let password = passwordTextField.text, !password.isEmpty else {
            alert(text: "Ooops!", description: "Please enter your password")
            return
        }
        guard let confirm = confirmTextField.text, !confirm.isEmpty else {
            alert(text: "Ooops!", description: "Please enter your password again")
            return
        }
        guard password == confirm else {
            alert(text: "Ooops!", description: "Your password and confirm password not same, please enter same passwords")
            return
        }
        FirebaseAuthService.shared.register(email: email, password: password) { result in
            if result {
                FirebaseService.shared.addUser(name: "", phone: "", email: email, withAutoId: true)
                FirebaseAuthService.shared.verify { result in
                    if result {
                        DispatchQueue.main.async {
                            let storyboard = UIStoryboard(name: "Main", bundle: nil)
                            let controller = storyboard.instantiateViewController(identifier: "RootModule")
                            controller.modalPresentationStyle = .fullScreen
                            if let window = UIApplication.shared.delegate as? AppDelegate {
                                window.window?.rootViewController = controller
                            }
                        }
                    } else {
                        DispatchQueue.main.async {
                            self.alert(text: "Ooops!", description: "Please enter your correct info")
                        }
                    }
                }
            } else {
                DispatchQueue.main.async {
                    self.alert(text: "Ooops!", description: "Please enter your correct info")
                }
            }
        }
        if  AuthService.shared.register(user: AuthService.User(name: name, surname: surname, email: email, password: confirm)) {
            
        } else {
            
        }
        
    }
    
    
}
