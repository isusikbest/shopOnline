//
//  RestoreWithEmailViewController.swift
//  shopOnline
//
//  Created by Vladimir Liubarskiy on 04/06/2024.
//

import UIKit


class RestoreWithEmailViewController: UIViewController {
    
    
    @IBOutlet var restoreEmailTextField: UITextField!
    
    @IBOutlet var restoreOneButton: UIButton!
    
    var tempEmail: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    private func configure() {
        restoreOneButton.layer.cornerRadius = 10
        restoreEmailTextField.text = tempEmail
    }
    
    @IBAction func restoreOneButtonDidTapped(_ sender: Any) {
        guard let email = restoreEmailTextField.text, !email.isEmpty else {
            alert(text: "Something wrong!", description: "Please enter your email")
            return
        }
        FirebaseAuthService.shared.restore(email: email) { result in
            DispatchQueue.main.async {
                if result {
                    self.navigationController?.popToRootViewController(animated: true)
                     
                } else {
                    DispatchQueue.main.async {
                        self.alert(text: "Something wrong!", description: "Please enter your correct email")
                    }
                }
            }
        }
      
        
    }
    
    
}
