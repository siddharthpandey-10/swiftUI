//
//  ContentView.swift
//  weSplit
//
//  Created by Siddharth Pandey on 21/09/25.
//

import SwiftUI

struct ContentView: View {
    @State private var checkAmount = 0.0
    @State private var numberOfPeople = 2
    @State var tipPercentage = 20
    @FocusState private var amountIsFocused : Bool
    
    let tipPercentages = [10,15,20,25,0]
    
    var totalPerPerson : Double{
        let peopleCount = Double(numberOfPeople + 2)
        let tipPercentage = Double(tipPercentage)
        let totalTip = checkAmount / 100 * tipPercentage
        let grandTotal = checkAmount + totalTip
        let totalPerPerson = grandTotal / peopleCount
        
        return totalPerPerson
        
    }
    var body: some View{
        NavigationStack{
            Form{
                Section{
                    TextField("Amount", value: $checkAmount, format: .currency(code: Locale.current.currency? .identifier ?? "USD"))
                        .keyboardType(.decimalPad)
                        .focused($amountIsFocused)
                    
                    Picker("Number of People", selection: $numberOfPeople){
                        ForEach(2..<100){
                            Text("\($0) people")
                        }
                    }
                    .pickerStyle(.navigationLink)
                    
                }
                
                Section("How much do you want to tip?"){
                    Picker("tip percentage", selection: $tipPercentage){
                        ForEach(tipPercentages, id: \.self){
                            Text($0 , format: .percent)
                        }
                    }
                    .pickerStyle(.segmented)
                }
                
                Section("Total Per Person"){
                    Text(totalPerPerson, format: .currency(code: Locale.current.currency? .identifier ?? "USD"))
                }
            }.navigationBarTitle("WeSplit")
            .toolbar{
                if amountIsFocused{
                    Button("Done"){
                        amountIsFocused = false
                    }
                }
                    
            }
            
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
