//
//  RestoreWithPasswordViewController.swift
//  shopOnline
//
//  Created by Vladimir Liubarskiy on 04/06/2024.
//

import UIKit


class RestoreWithPasswordViewController: UIViewController {
    
    @IBOutlet var restorePasswordTextField: UITextField!
    
    @IBOutlet var restoreConfirmTextField: UITextField!
    
    @IBOutlet var restoreThreeButton: UIButton!
    var tempEmail: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    @IBAction func restoreThreeButtonDidTapped(_ sender: Any) {
        guard let password = restorePasswordTextField.text, !password.isEmpty else {
            alert(text: "Oooops", description: "Please enter your  password!")
            return
        }
        guard let confirm = restoreConfirmTextField.text, !confirm.isEmpty else {
            alert(text: "Something wrong!", description: "Please enter correct password")
            return
        }
        guard password == confirm else {
            alert(text: "Ooops!", description: "Your password and confirm password not the same,please enter same passwords")
            return
        }
        if  AuthService.shared.change(password: confirm, email: tempEmail ?? "") {
            navigationController?.popToRootViewController(animated: true)
        } else {
            
        }
    }
    
    
    private func configure() {
        restoreThreeButton.layer.cornerRadius = 10
    }
}
