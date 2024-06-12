//
//  Extension.swift
//  shopOnline
//
//  Created by Vladimir Liubarskiy on 07/06/2024.
//

import UIKit

extension UIViewController {
    func alert(text: String, description: String) {
        let alert = UIAlertController(title: text, message: description, preferredStyle: .alert)
        let action = UIAlertAction(title: "Close", style: .default, handler: nil)
        alert.addAction(action)
        present(alert, animated: true)
    }
}
