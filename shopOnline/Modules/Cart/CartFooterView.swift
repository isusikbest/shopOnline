//
//  CartFooterView.swift
//  shopOnline
//
//  Created by Vladimir Liubarskiy on 04/08/2024.
//

import UIKit

class CartFooterView: UIView {
    
    var onTapCheckout: (() -> Void)?
    
    @IBOutlet weak var checkoutLabel: UILabel!
    
    @IBOutlet weak var checkoutButton: UIButton!
    
    override  func awakeFromNib() {
        super.awakeFromNib()
    }
    
    @IBAction func checkout() {
        onTapCheckout?()
    }
    func set(items: [ProductStorage]) {
        var sum = 0
        for item in items {
            sum += item.price
        }
        checkoutLabel.text = "Total:\(sum)$"
    }
}
