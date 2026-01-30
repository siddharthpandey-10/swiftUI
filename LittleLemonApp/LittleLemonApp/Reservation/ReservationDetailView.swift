//
//  ReservationDetailView.swift
//  LittleLemonApp
//
//  Created by Siddharth Pandey on 14/07/25.
//
import SwiftUI
struct ReservationDetailView: View {
    let reservation: Reservation
    
    var body: some View {
        VStack(spacing: 10) {
            Text("Reservation at \(reservation.restaurant.city)").bold()
            Text("For: \(reservation.customerName)")
            Text("Party Size: \(reservation.party)")
            Text("Email: \(reservation.customerEmail)")
            Text("Phone: \(reservation.customerPhoneNumber)")
            Text("Special: \(reservation.specialRequests)")
            Text("Date: \(reservation.reservationDate.formatted(date: .abbreviated, time: .shortened))")
        }
        .padding()
        .background(RoundedRectangle(cornerRadius: 10).fill(Color.gray.opacity(0.1)))
        .padding()
    }
}
