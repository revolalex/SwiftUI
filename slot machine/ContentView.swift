//
//  ContentView.swift
//  slot machine
//
//  Created by Alexandre RODRIGUEZ on 05/02/2020.
//  Copyright © 2020 Alexandre Rodriguez. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    private var symbols = ["apple", "star", "cherry"]
    
    @State private var numbers = [1, 2, 0]
    
    @State private var credits = 1000
    
    private var betAmount = 5
    
    var body: some View {
       
        //background
        ZStack{
            // rectangle orange ignore safe area
            Rectangle().foregroundColor(Color(red: 200/255, green: 143/255, blue: 32/255)).edgesIgnoringSafeArea(.all)
            
            // rectangle yellow rotate 45° ignore safe area
            Rectangle().foregroundColor(Color(red: 228/255, green: 195/255, blue: 76/255)).rotationEffect(Angle(degrees: 45)).edgesIgnoringSafeArea(.all)
            
        VStack {
            
            Spacer()
            
            HStack {
        
                // Title
                Image(systemName: "star.fill")
                    .foregroundColor(.yellow)
                
                Text("SwiftUI Slots").bold()
                    .foregroundColor(.white)
                
                Image(systemName: "star.fill")
                    .foregroundColor(.yellow)
            }.scaleEffect(2) // make it bigger
            
            Spacer()
            
            // Credits counter
                Text("Credits:" + String(credits))
                    .foregroundColor(.black)
                    .padding(.all, 10)
                    .background(Color.white.opacity(0.5))
                    .cornerRadius(20)
            
            Spacer()
            
            // Cards
            HStack {
            Spacer()
                Image(symbols[numbers[0]])
                    .resizable()
                    .aspectRatio(1, contentMode: .fit)
                    .background(Color.white.opacity(0.5))
                    .cornerRadius(20)
                
                Image(symbols[numbers[1]])
                    .resizable()
                    .aspectRatio(1, contentMode: .fit)
                    .background(Color.white.opacity(0.5))
                    .cornerRadius(20)
                    
                Image(symbols[numbers[2]])
                    .resizable()
                    .aspectRatio(1, contentMode: .fit)
                    .background(Color.white.opacity(0.5))
                    .cornerRadius(20)
            }
            
            
            Spacer()
            // button
            Button(action:  {
                // change the images
                self.numbers[0] = Int.random(in: 0...self.symbols.count - 1)
                self.numbers[1] = Int.random(in: 0...self.symbols.count - 1)
                self.numbers[2] = Int.random(in: 0...self.symbols.count - 1)
                
                // check winnings
                if self.numbers[0] == self.numbers[1]
                    && self.numbers[1] == self.numbers[2]{
                    // won
                    self.credits += self.betAmount * 10
                }
                else {
                    self.credits -= self.betAmount
                }
            }) {
                Text("Spin").bold()
                    .foregroundColor(.white)
                    .padding(.all, 10)
                    .padding([.leading, .trailing], 30)
                    .background(Color.pink)
                    .cornerRadius(20)
                
            }
            Spacer()
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
}
