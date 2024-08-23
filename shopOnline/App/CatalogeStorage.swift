//
//  CatalogeStorage.swift
//  shopOnline
//
//  Created by Vladimir Liubarskiy on 21/06/2024.
//

import Foundation
import UIKit



struct CatalogeStorage {
    let name: String
    let description: String
    let price: Double
    let image: UIImage
}


class CatalogeService {
    private init() {}
    static let shared = CatalogeService()
    let products: [CatalogeStorage] = [
        CatalogeStorage(name: "Babolat tennis racket", description: "For professionals and amateurs", price: 400.00, image: UIImage(named: "babolat")!),
        CatalogeStorage(name: "Wilson tennis racket", description: "For beginners", price: 200.00,image: UIImage(named: "wilson")!),
        CatalogeStorage(name: "Yonex tennis racket", description: "For all players", price: 300.00,image:  UIImage(named: "yonex")!),
        CatalogeStorage(name: "Shoes", description: "Very comfortable to play", price: 100.00,image:  UIImage(named: "shoes")!),
    ]
}

