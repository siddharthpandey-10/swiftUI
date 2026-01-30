//
//  RestaurantView.swift
//  LittleLemonApp
//
//  Created by Siddharth Pandey on 14/07/25.
//

import SwiftUI

struct RestaurantView: View {
    let location: RestaurantLocation
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(location.city).font(.headline)
            Text(location.neighborhood).font(.subheadline)
            Text(location.phoneNumber).font(.caption).foregroundColor(.gray)
        }
    }
}
