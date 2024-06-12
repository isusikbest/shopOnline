//
//  AuthService.swift
//  shopOnline
//
//  Created by Vladimir Liubarskiy on 04/06/2024.
//

import UIKit



class AuthService {
    
    private init() {}
    
    static let shared = AuthService()
    
    struct User {
        let name: String
        let surname: String
        let email: String
        var password: String
        var restoreCode: String? = nil
    }
    var storage = UserDefaults(suiteName: "group.shop.online")
    
    let key = "k_users"
    
    var users: [User] {
        get {
            guard let temp = storage?.object(forKey: key) as? [[String : Any]] else {
                return []
            }
            var items: [User] = []
            for item in temp {
                let user = User(name: (item["name"] as? String) ?? "", surname: (item["surname"] as? String) ?? "", email: (item["email"] as? String) ?? "", password: (item["password"] as? String) ?? "", restoreCode: (item["restoreCode"] as? String))
                items.append(user)
            }
            return items
        }
        set { 
            var items:[[String: Any]] = []
            for user in newValue {
                let temp = ["name": user.name, "surname": user.surname, "email": user.email, "password": user.password, "restoreCode": user.restoreCode ?? ""]
                items.append(temp)
            
            }
            storage?.setValue(items, forKey: key)
        }
        
    }

    func login(email: String, password: String) -> User? {
        guard let index = users.firstIndex(where: {$0.email == email}) else {
            return nil
        }
        guard users[index].email == email && users[index].password == password  else {
            return nil
        }
        return users[index]
    }
    
    
    
    
    
    func register(user: User) -> Bool {
        guard !users.contains(where: {$0.email == user.email}) else {
            return false
        }
        users.append(user)
        return true
    }
    
    
    
    
    
    
    
    func restore(email: String) -> String? {
        var items = users
        guard let index = items.firstIndex(where: {$0.email == email}) else {
            return nil
        }
        let random = Int.random(in: 1000...9999)
        items[index].restoreCode = String(random)
        users = items
        return String(random)
       
    }
    func fetch(email: String) -> User? {
        return users.first(where: {$0.email == email})
    }
    func change(password: String, email: String) -> Bool {
        var items = users
        guard let index = items.firstIndex(where: {$0.email == email}) else {
            return false
        }
        items[index].password = password
        users = items
        return true
    }
}
