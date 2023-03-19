//
//  ContentView.swift
//  Cabuddy
//
//  Created by Pavan on 19/03/23.
//

import SwiftUI

struct EventListView: View {
    @ObservedObject var viewModel = EventListVM()
    
    var body: some View {
        List(viewModel.events, id: \.title) { event in
            NavigationLink(destination: EventDetailView(event: event)) {
                EventRow(event: event)
            }
        }
        .onAppear {
            viewModel.fetchItems()
        }
        .navigationBarTitle("Event List")
    }
}

struct EventRow: View {
    let event: Event
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(event.title)
                .font(.headline)
            Text(event.description)
                .font(.subheadline)
            Text(event.additionalInfo)
                .font(.subheadline)
                .foregroundColor(.gray)
        }
    }
}


struct EventList_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            EventListView()
        }
    }
}
