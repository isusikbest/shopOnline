//
//  FirebaseService.swift
//  shopOnline
//
//  Created by Vladimir Liubarskiy on 05/07/2024.
//

import Foundation
import FirebaseDatabase

struct ProductStorage {
    let title: String
    let description: String
    let price: Int
    let image: String
}
class FirebaseService {
    var ref: DatabaseReference!
    private init() {
        ref = Database.database().reference()
    }
    static let shared = FirebaseService()
    func addUser(name: String, phone: String, email: String, withAutoId: Bool) {
        if withAutoId {
            ref.child("data").child("users").childByAutoId().setValue(["name": name, "phone" : phone, "email" : email])
        } else {
            ref.child("data").child("users").observeSingleEvent(of: .value) { snapshot  in
                guard var value = snapshot.value as? [String : [String : Any]] else {
                    return
                }
                value[UUID().uuidString] = ["name": name, "phone" : phone, "email" : email]
                self.ref.child("data").child("users").setValue(value)
            }
        }
      
        
    }
    func findChildren() {
        ref.child("data").child("users").queryOrdered(byChild: "email").queryEqual(toValue: "alex321@gmail.com").observeSingleEvent(of: .value) { snaphot in
            guard  let value = snaphot.value as? [String : [String : String]] else {
                return
            }
            print(value.keys)
        }
            
    }
    func updateChildren(name: String) {
        ref.child("data").child("users").queryOrdered(byChild: "email").queryEqual(toValue: "alex321@gmail.com").observeSingleEvent(of: .value) { snaphot in
            guard  let value = snaphot.value as? [String : [String : String]] else {
                return
            }
            guard let first = value.first?.key else {
                return
            }
            self.ref.child("data").child("users").child(first).child("name").setValue(name)
        }
        
    }
    func fetchProducts(completion: @escaping ([ProductStorage]) -> Void) {
        ref.child("data").child("products").observeSingleEvent(of: .value) { snaphot in
            guard  let value = snaphot.value as? [String : [String : Any]] else {
                completion([])
                return
            }
            var temp: [ProductStorage] = []
            for item in value {
                if let title = item.value["title"] as? String, let description = item.value["description"] as? String, let price = item.value["price"] as? Int, let image = item.value["image"] as? String {
                    let product = ProductStorage(title: title, description: description, price: price, image: image)
                    temp.append(product)
                } else {
                    continue
                    
                }
               
            }
            completion(temp)
        }
    }
    
    
    
}

