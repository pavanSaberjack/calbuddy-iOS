//
//  AuthenticationVM.swift
//  Cabuddy
//
//  Created by YML1 on 30/04/23.
//

import Foundation

class AuthenticationVM {

    // Create a method to handle the sign in process using completion handle
//    func signIn(completion: @escaping (Bool, Error?) -> Void) {
//        GIDSignIn.sharedInstance.signIn(withPresenting: self) { signInResult, error in
//            guard error == nil else {
//                completion(false, error)
//                return
//            }
//
//            // If sign in succeeded, display the app's main content View.
//            guard let signInResult = signInResult else { return }
//
//            signInResult.user.refreshTokensIfNeeded { user, error in
//                guard error == nil else { return }
//                guard let user = user else { return }
//
//                let idToken = user.idToken
//                // Send ID token to backend (example below).
//            }
//        }
//    }
}
