//
//  CheckOutViewController.swift
//  shopOnline
//
//  Created by Vladimir Liubarskiy on 04/08/2024.
//

import UIKit


class CheckOutViewController: UIViewController {
    
    @IBOutlet var nameTextField: UITextField!
    
    @IBOutlet var adressTextField: UITextField!
    
    @IBOutlet var phoneNumberTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func finishButtonPressed(_ sender: Any) {
        guard let name  = nameTextField.text, !name.isEmpty else { return }
        guard let adrees = adressTextField.text, !adrees.isEmpty else { return }
        guard let phone = phoneNumberTextField.text, !phone.isEmpty else { return }
        CustomersService.shared.items.append(CustomersService.InfoCard(name: name, adress: adrees, phone: phone, products: CartService.shared.cart))
        CartService.shared.removeAll()
        dismiss(animated: true)
    }
    
}
