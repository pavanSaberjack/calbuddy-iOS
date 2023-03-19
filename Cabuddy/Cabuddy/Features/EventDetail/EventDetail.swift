//
//  EventDetail.swift
//  Cabuddy
//
//  Created by Pavan on 19/03/23.
//

import SwiftUI

struct EventDetailView: View {
    let event: Event
    
    var body: some View {
        VStack {
            Text(event.title)
                .font(.headline)
            Text(event.description)
                .font(.subheadline)
            Text(event.additionalInfo)
                .font(.subheadline)
                .foregroundColor(.gray)
        }
        .padding()
        .navigationTitle(event.title)
    }
}

struct EventDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            let event = Event(title: "Hey", description: "hi", additionalInfo: "oleee")
            
            EventDetailView(event: event)
        }
    }
}
