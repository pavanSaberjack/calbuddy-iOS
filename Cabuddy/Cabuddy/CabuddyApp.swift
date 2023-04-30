//
//  CabuddyApp.swift
//  Cabuddy
//
//  Created by Pavan on 19/03/23.
//

import SwiftUI
import GoogleSignIn

@main
struct CabuddyApp: App {
    var body: some Scene {
        WindowGroup {
            RootView()
                .onOpenURL { url in
                    GIDSignIn.sharedInstance.handle(url)
                }
                .onAppear {
                    GIDSignIn.sharedInstance.restorePreviousSignIn { user, error in
                        // Check if `user` exists; otherwise, do something with `error`
                        guard error == nil else {
                            return
                        }
                        
                        guard let user = user else {
                            return
                        }
                        
                        user.refreshTokensIfNeeded { user, error in
                            guard error == nil else { return }
                            guard let user = user else { return }
                            
                            let idToken = user.idToken
                            // Send ID token to backend (example below).
                            updateUserInfo(idToken: idToken!.tokenString, userEmail: user.profile!.email)
                        }
               
                    }
                }
        }
    }
    
    func updateUserInfo(idToken: String, userEmail: String) {
        let formData = [
                        "idToken": idToken,
                        "emailId": userEmail
                        ]
        
        guard let authData = try? JSONEncoder().encode(formData) else {
            return
        }
        let url = URL(string: "http://localhost:8080/user")!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")

        
        let task = URLSession.shared.uploadTask(with: request, from: authData) { data, response, error in
            // Handle response from your backend.
        }
        task.resume()
    }
}
