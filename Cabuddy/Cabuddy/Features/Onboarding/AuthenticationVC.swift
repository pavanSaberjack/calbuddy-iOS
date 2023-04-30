//
//  AuthenticationVC.swift
//  Cabuddy
//
//  Created by YML1 on 30/04/23.
//

import UIKit
import GoogleSignIn

class AuthenticationVC: UIViewController {
    let authenticationVM = AuthenticationVM()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func signIn(sender: Any) {
        GIDSignIn.sharedInstance.signIn(withPresenting: self) {[weak self] signInResult, error in
            guard error == nil else {
                
                // Show the error message in Alert View
                let alert = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                self?.present(alert, animated: true)
                return
            }
            
            // If sign in succeeded, display the app's main content View.
            guard let signInResult = signInResult else { return }
            
            signInResult.user.refreshTokensIfNeeded {[weak self]  user, error in
                guard error == nil else { return }
                guard let user = user else { return }
                
                let idToken = user.idToken
                // Send ID token to backend (example below).
                self?.updateUserInfo(idToken: idToken!.tokenString, userEmail: user.profile!.email)
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
