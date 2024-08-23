//
//  CartService.swift
//  shopOnline
//
//  Created by Vladimir Liubarskiy on 04/08/2024.
//

import Foundation



class CartService {
    private init() {}
    static let shared = CartService()
    
    var cart: [ProductStorage] = []
    
    func addToCart(item: ProductStorage) {
        guard !cart.contains(where: { $0.title == item.title }) else { return }
        cart.append(item)
    }
    func removeFromCart(index: Int) {
        
    }
    func removeAll() {
        cart.removeAll()
    }
}
