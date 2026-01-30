//
//  LocationsView.swift
//  LittleLemonApp
//
//  Created by Siddharth Pandey on 14/07/25.
//

import SwiftUI

struct LocationsView: View {
    @EnvironmentObject var model: Model
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                LittleLemonLogo()
                    .padding(.top, 20)
                
                HStack {
                    Spacer()
                    Text("Select a location")
                        .padding()
                        .background(Color.gray.opacity(0.2))
                        .cornerRadius(20)
                    Spacer()
                }
                
                List(model.restaurantLocations) { location in
                    NavigationLink(destination: ReservationForm(restaurant: location)
                                   .environmentObject(model)) {
                                    RestaurantView(location: location)
                    }
                }
                .listStyle(PlainListStyle())
            }
            .padding()
            .navigationBarHidden(true)
        }
    }
}
