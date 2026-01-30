//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Siddharth Pandey on 23/10/25.
//

import SwiftUI

struct ContentView: View {
   @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Monaco", "Nigeria", "Poland", "Spain", "UK", "Ukraine", "US"].shuffled()
    
   @State private var correctAnswer = Int.random(in :0...2)
    
    @State private var scoreTitle = ""
    @State private var showingScore = false
    @State private var score = 0
    
    var body: some View {
        ZStack {
            RadialGradient(stops:[
                    .init(color: Color(red: 0.1, green: 0.2, blue:0.45),location: 0.3),
                    .init(color: Color(red: 0.76, green: 0.2, blue:0.26),location: 0.3),
                    
                ], center: .top, startRadius: 200, endRadius: 700).ignoresSafeArea()
            
            VStack{
                Spacer()
                Text("Guess The Flag")
                    .foregroundColor(Color.white)
                    .font(.largeTitle.weight(.heavy))
                    .padding(20)
                VStack(spacing : 15){
                    VStack{
                        VStack{
                            Text("Tap the Flag of:")
                                .foregroundStyle(Color.black)
                                .font(.subheadline.weight(.heavy))
                            Text(countries[correctAnswer])
                                .foregroundStyle(Color.secondary)
                                .font(.largeTitle.weight(.heavy))
                            
                        }
                        ForEach(0..<3){number in
                            Button {
                                flagTapped(number)
                            } label :{
                                Image(countries[number])
                                    .shadow(radius : 5)
                                    .clipShape(Capsule())
                            }
                            
                        }
                        
                    }
                    
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 20)
                    .background(.regularMaterial)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    
                    Spacer()
                    Spacer()
                    
                    Text("Score ???")
                        .foregroundColor(Color.white)
                        .font(.title.bold())
                    Spacer()
                    
                }
            }
            .alert(scoreTitle, isPresented: $showingScore ){
                    Button ("Continue", action : askQuestion)
                    Button("Cancel", role : .cancel){ }
                   
                }
            message: {
                Text("your Score is \(score)")
            }
        }
    }
        
    
    func flagTapped(_ number: Int){
        if number == correctAnswer{
            scoreTitle = "Correct"
            score += 1
        }else {
            scoreTitle = "Wrong"
            score -= 1
        }
        
        showingScore = true
    }
    
    func askQuestion(){
        countries.shuffle()
        correctAnswer = Int.random(in : 0...2)
    }
        
    
}

#Preview {
    ContentView()
}
