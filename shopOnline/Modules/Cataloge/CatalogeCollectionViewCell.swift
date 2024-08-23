//
//  CollectionViewCell.swift
//  shopOnline
//
//  Created by Vladimir Liubarskiy on 21/06/2024.
//

import Foundation
import UIKit
import Kingfisher


class CatalogeCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet var imageLabel: UIImageView!
    
    @IBOutlet var tittleLabel: UILabel!
    
    @IBOutlet var descriptionLabel: UILabel!
    
    @IBOutlet var priceLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configure()
    }
    
    func configure() {
        layer.borderColor = UIColor.lightGray.cgColor
        layer.borderWidth = 1
    }
    
    func set(product: ProductStorage) {
        tittleLabel.text = product.title
        descriptionLabel.text = product.description
        priceLabel.text = "\(product.price)$"
        if let url = URL(string: product.image) {
            imageLabel.kf.setImage(with: url)
        }
            
    }
    
    
}

