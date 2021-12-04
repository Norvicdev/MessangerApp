//
//  AuthManager.swift
//  MessangerApp
//
//  Created by Stefan Dojcinovic on 3.12.21..
//

import Foundation
import FirebaseAuth

final class AuthManager {
    
    static let shared = AuthManager()
    
    private init() {  }
    
    /// Function called to sign in user
    public func signIn(email: String, password: String, completion: @escaping (Result<Bool, Error>) -> Void) {
        Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
            guard error == nil else {
                completion(.failure(error!))
                return
            }
            completion(.success(true))
        }
    }
    
    /// Function called to create a new user account
    public func singUp(email: String, password: String, user: User, completion: @escaping (Result<Bool, Error>) -> Void) {
        Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
            guard error == nil else {
                completion(.failure(error!))
                return
            }
            completion(.success(true))
        }
    }
    
    /// Function called to sign out current user
    public func signOut(completion: @escaping (Bool) -> Void) {
        do {
            try Auth.auth().signOut()
            completion(true)
        } catch {
            completion(false)
            return
        }
    }
    
}
