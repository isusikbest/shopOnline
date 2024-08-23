//
//  CatalogeViewController.swift
//  shopOnline
//
//  Created by Vladimir Liubarskiy on 21/06/2024.
//

import Foundation
import UIKit

class CatalogeViewController: UIViewController {
    
    @IBOutlet var collectionView: UICollectionView!
    
    var products: [ProductStorage] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
   
    func configure() {
        collectionView.delegate = self
        collectionView.dataSource = self
        
        UIWindow.showLoader()
        FirebaseService.shared.fetchProducts { products in
            self.products = products
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                self.collectionView.reloadData()
                UIWindow.hideLoader()
            }
        }
    }
}
extension CatalogeViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return products.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: CatalogeCollectionViewCell.self), for: indexPath) as! CatalogeCollectionViewCell
        cell.set(product: products[indexPath.item])
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .init(top: 0, left: 0, bottom: 0, right: 0)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (UIScreen.main.bounds.width)
        return .init(width: width / 2, height: 250)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
   }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyBoard.instantiateViewController(withIdentifier: "ProductViewController") as! ProductViewController
        let product = products[indexPath.item]
        controller.product = product
        present(controller, animated: true)
    }
    
}
