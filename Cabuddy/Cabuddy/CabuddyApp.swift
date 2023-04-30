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
                    }
                }
        }
    }
}
