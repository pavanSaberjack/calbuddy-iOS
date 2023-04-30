//
//  CalbuddyService.swift
//  Cabuddy
//
//  Created by YML1 on 30/04/23.
//

import Foundation

class CalbuddyService: APIService {
    var baseURL: URL = URL(string: "https://yourbackend.example.com/tokensignin")!
    
    func updateSignInToken(idToken: String, completion: @escaping APIServiceCompletion) {
        
    }
    
    func tokenSignInExample(idToken: String) {
        guard let authData = try? JSONEncoder().encode(["idToken": idToken]) else {
            return
        }
        var request = URLRequest(url: baseURL)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")

        let task = URLSession.shared.uploadTask(with: request, from: authData) { data, response, error in
            // Handle response from your backend.
        }
        task.resume()
    }
}
