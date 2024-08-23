//
//  CustomersService.swift
//  shopOnline
//
//  Created by Vladimir Liubarskiy on 04/08/2024.
//

import UIKit


class CustomersService {
    private init() {}
    static let shared = CustomersService()
    
    struct InfoCard {
        let name: String
        let adress: String
        let phone: String
        let products: [ProductStorage]
        
    }
    var items: [CustomersService.InfoCard] = []
    
    func append(item: CustomersService.InfoCard) {
        items.append(item)
    }
}
