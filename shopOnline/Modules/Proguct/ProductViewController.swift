//
//  ProductViewController.swift
//  shopOnline
//
//  Created by Vladimir Liubarskiy on 21/06/2024.
//

import Foundation
import UIKit
import Kingfisher



class ProductViewController: UIViewController {
    
    var product: ProductStorage?
    
    
    @IBOutlet var imageLabel: UIImageView!
    
    @IBOutlet var titleLabel: UILabel!
    
    @IBOutlet var descriptionLabel: UILabel!
    
    @IBOutlet var priceLabel: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        fillData()
    }
    
    func configure() {
        
    }
    func fillData() {
        guard let product = product else {
            self.dismiss(animated: true)
            return
        }
        if let url = URL(string: product.image) {
            imageLabel.kf.setImage(with: url)
            
        }
        titleLabel.text = product.title
        descriptionLabel.text = product.description
        priceLabel.text = "\(product.price)$"
    }
    
    @IBAction func addActionDidPressed(_ sender: Any) {
        guard let product = product else { return }
        CartService.shared.addToCart(item: product)
        dismiss(animated: true)
    }
    
    
    @IBAction func closeButton(_ sender: Any) {
        dismiss(animated: true)
    }
    
    
}
