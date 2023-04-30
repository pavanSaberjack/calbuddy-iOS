//
//  AuthenticationVC.swift
//  Cabuddy
//
//  Created by YML1 on 30/04/23.
//

import UIKit
import GoogleSignIn

class AuthenticationVC: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func signIn(sender: Any) {
      GIDSignIn.sharedInstance.signIn(withPresenting: self) { signInResult, error in
        guard error == nil else { 

          // Show the error message in Alert View
          let alert = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: .alert)
          alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
          self.present(alert, animated: true)          
          return 
        }

        // If sign in succeeded, display the app's main content View.
        signInResult?.user
      }
    }
}
