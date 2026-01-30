//
//  ReservationForm.swift
//  LittleLemonApp
//
//  Created by Siddharth Pandey on 14/07/25.
//
import SwiftUI

struct ReservationForm: View {
    @EnvironmentObject var model: Model
    let restaurant: RestaurantLocation
    
    @State private var customerName: String = ""
    @State private var customerEmail: String = ""
    @State private var customerPhoneNumber: String = ""
    @State private var party: Int = 1 {
        didSet {
            if party < 1 { party = 1 }
        }
    }
    @State private var specialRequests: String = ""
    @State private var reservationDate: Date = Date()
    @State private var showFormInvalidMessage: Bool = false
    @State private var errorMessage: String = ""
    
    var body: some View {
       HStack {
                Spacer()
                Text("Reservation Details")
                    .padding()
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(20)
                Spacer()
            }
        Form {
            Section(header: Text("\(restaurant.city)")
                .bold()
                .foregroundColor(.black)
            ) {
                TextField("Your Name", text: $customerName)
                TextField("Email", text: $customerEmail)
                TextField("Phone Number", text: $customerPhoneNumber)
                Stepper("Party Size: \(party)", value: $party, in: 1...20)
                TextField("Special Requests", text: $specialRequests)
                DatePicker("Date", selection: $reservationDate)
            }
            
            HStack{
                Spacer()
                Button(action:{
                    validateForm()
                },
                       label:{
                    
                    Text("CONFIRM RESERVATION")
                        .foregroundColor(.white)
                        .background(Color.blue)
                        .cornerRadius(10)
                }
                )
                Spacer()
            }
         
        }
        .onAppear { model.displayingReservationForm = true }
        .onDisappear { model.displayingReservationForm = false }
        .alert("Reservation Error", isPresented: $showFormInvalidMessage, actions: {
            Button("OK", role: .cancel) {}
        }, message: {
            Text(errorMessage)
        })
    }
    
    func validateForm() {
        var errors = [String]()
        if customerName.trimmingCharacters(in: .whitespaces).count < 3 || !customerName.allSatisfy({ $0.isLetter || $0.isWhitespace }) {
            errors.append("Names can only contain letters and must have at least 3 characters")
        }
        if !customerEmail.contains("@") || customerEmail.trimmingCharacters(in: .whitespaces).isEmpty {
            errors.append("The email address is invalid")
        }
        if customerPhoneNumber.trimmingCharacters(in: .whitespaces).isEmpty {
            errors.append("The phone number can not be blank")
        }
        if errors.isEmpty {
            model.reservation = Reservation(
                restaurant: restaurant,
                customerName: customerName,
                customerEmail: customerEmail,
                customerPhoneNumber: customerPhoneNumber,
                reservationDate: reservationDate,
                party: party,
                specialRequests: specialRequests
            )
            model.tabViewSelectedIndex = 1
        } else {
            errorMessage = errors.joined(separator: "\n")
            showFormInvalidMessage = true
        }
    }
}
