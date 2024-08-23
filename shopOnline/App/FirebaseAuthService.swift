//
//  AuthService.swift
//  shopOnline
//
//  Created by Vladimir Liubarskiy on 02/07/2024.
//

import Foundation
import FirebaseAuth

struct FirebaseUser {
    let email: String
}

class FirebaseAuthService {
    private init() {}
    static let shared = FirebaseAuthService()
    var current: FirebaseUser? {
        if let user = Auth.auth().currentUser, let email = user.email {
            return FirebaseUser(email: email)
        } else {
            return nil
        }
    }
    
    func login(email: String, password: String, completion: @escaping (Bool) -> Void) {
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            print(error?.localizedDescription)
            completion(error == nil)
        }
    }
    func register(email: String, password: String, completion: @escaping (Bool) -> Void) {
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            print(error?.localizedDescription)
            completion(error == nil)
        }
    }
    func verify(completion: @escaping (Bool) -> Void) {
        Auth.auth().currentUser?.sendEmailVerification(completion: { error in
            print(error?.localizedDescription)
            completion(error == nil)
        })
    }
    func logout() {
        do {
           try Auth.auth().signOut()
        } catch(let error) {
            print(error.localizedDescription)
        }
    }
    func restore(email: String, completion: @escaping (Bool) -> Void) {
        Auth.auth().sendPasswordReset(withEmail: email) { error in
            print(error?.localizedDescription)
            completion(error == nil)
        }
    }
        
    
}
