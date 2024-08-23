//
//  AuthViewController.swift
//  shopOnline
//
//  Created by Vladimir Liubarskiy on 04/06/2024.
//

import UIKit
import FirebaseAuth
class AuthViewController: UIViewController {
    
    
    @IBOutlet 
    var sighInButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    private func configure() {
        sighInButton.layer.cornerRadius = 10
    }
    
    
    @IBAction func createButtonDidTapped(_ sender: Any) {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        guard let controller = storyBoard.instantiateViewController(withIdentifier: String(describing: SighUpViewController.self)) as? SighUpViewController else {
            return
        }
        navigationController?.pushViewController(controller, animated: true)
    }
    
    @IBAction func sighInDidTapped(_ sender: Any) {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        guard let controller = storyBoard.instantiateViewController(withIdentifier: String(describing: SighInViewController.self)) as? SighInViewController else {
            return
        }
        navigationController?.pushViewController(controller, animated: true)
    }
    
   
}
