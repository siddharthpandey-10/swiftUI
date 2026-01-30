//
//  MainView.swift
//  LittleLemonApp
//
//  Created by Siddharth Pandey on 14/07/25.
//

import SwiftUI

struct MainView: View {
    @EnvironmentObject var model: Model
    
    var body: some View {
        TabView(selection: $model.tabViewSelectedIndex) {
            LocationsView()
                .tabItem {
                    Label("Locations", systemImage: "fork.knife")
                }
                .tag(0)
            
            if let reservation = model.reservation {
                ReservationDetailView(reservation: reservation)
                    .tabItem {
                        Label("Reservation", systemImage: "note.text")
                    }
                    .tag(1)
            } else {
                Text("No Reservation Yet")
                    .tabItem {
                        Label("Reservation", systemImage: "note.text")
                    }
                    .tag(1)
            }
        }
    }
}
