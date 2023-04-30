//
//  RootView.swift
//  Cabuddy
//
//  Created by YML1 on 30/04/23.
//

import SwiftUI

struct RootView: View {
    @State private var isPresented = false
    
    var body: some View {
        Button("Present View Controller") {
            self.isPresented = true
        }
        .sheet(isPresented: $isPresented) {
            AuthenticationVCRepresentable()
        }
    }
}

struct AuthenticationVCRepresentable: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> AuthenticationVC {
        let vc = AuthenticationVC()
        return vc
    }
    
    func updateUIViewController(_ uiViewController: AuthenticationVC, context: Context) {
        //
    }
}

struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        RootView()
    }
}
