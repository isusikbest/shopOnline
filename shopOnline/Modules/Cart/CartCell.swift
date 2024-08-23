//
//  CartCell.swift
//  shopOnline
//
//  Created by Vladimir Liubarskiy on 03/08/2024.
//

import UIKit

class CartCell: UITableViewCell {
    
    @IBOutlet var imageCellLabel: UIImageView!
    
    @IBOutlet var titleCellLabel: UILabel!
    
    @IBOutlet var priceCellLabel: UILabel!
    
    
    override  func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func set(product: ProductStorage) {
        titleCellLabel.text = product.title
        priceCellLabel.text = "\(product.price)$"
        if let url = URL(string: product.image) {
            imageCellLabel.kf.setImage(with: url)
        }
        
    }
}

