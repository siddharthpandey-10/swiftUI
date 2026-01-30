//
//  RestaurantLocation.swift
//  LittleLemonApp
//
//  Created by Siddharth Pandey on 14/07/25.
//

import SwiftUI
struct RestaurantLocation: Identifiable, Hashable {
    var id = UUID()
    let city: String
    let neighborhood: String
    let phoneNumber: String
}
