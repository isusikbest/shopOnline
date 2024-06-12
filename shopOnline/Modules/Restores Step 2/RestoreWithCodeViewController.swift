//
//  RestoreWithCodeViewController.swift
//  shopOnline
//
//  Created by Vladimir Liubarskiy on 04/06/2024.
//

import UIKit

class RestoreWithCodeViewController: UIViewController {
    
    @IBOutlet var restoreCodeTextField: UITextField!
    
    @IBOutlet var restoreTwoButton: UIButton!
    var tempEmail: String?
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    @IBAction func restoreTwoButtonDidTapped(_ sender: Any) {
        guard let text = restoreCodeTextField.text, !text.isEmpty else {
            return
        }
        guard text == AuthService.shared.fetch(email: tempEmail ?? "")?.restoreCode else {
            alert(text: "Something Wrong!", description: "Please enter coorect code")
            return
        }
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        guard let controller = storyBoard.instantiateViewController(withIdentifier: "RestoreWithPasswordViewController") as? RestoreWithPasswordViewController else {
            return
        }
        controller.tempEmail = tempEmail
        navigationController?.pushViewController(controller, animated: true)
    }
    
    private func configure() {
        restoreTwoButton.layer.cornerRadius = 10
    }
}
