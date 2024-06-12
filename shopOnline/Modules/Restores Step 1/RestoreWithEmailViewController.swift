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
        if let code = AuthService.shared.restore(email: email) {
            let storyBoard = UIStoryboard(name: "Main", bundle: nil)
            guard  let controller = storyBoard.instantiateViewController(withIdentifier: "RestoreWithCodeViewController") as? RestoreWithCodeViewController else {
                return
            }
            controller.tempEmail = email
            PushService.shared.notify(text: code)
            navigationController?.pushViewController(controller, animated: true)
            
        } else  {
            alert(text: "Something wrong!", description: "Please enter your correct email")
        }
        
    }
    
    
}
