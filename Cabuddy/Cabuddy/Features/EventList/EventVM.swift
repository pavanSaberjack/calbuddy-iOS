//
//  EventVM.swift
//  Cabuddy
//
//  Created by Pavan on 19/03/23.
//

import Foundation

class EventListVM: ObservableObject {
    @Published var events: [Event] = []

    func fetchItems() {
        guard let url = URL(string: "http://localhost:8080/events") else { return }
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data, error == nil else {
                print("Error fetching items: \(error?.localizedDescription ?? "Unknown error")")
                return
            }
            do {
                self.events = try JSONDecoder().decode([Event].self, from: data)
            } catch {
                print("Error decoding items: \(error.localizedDescription)")
            }
        }.resume()
    }
}
