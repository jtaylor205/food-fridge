//
//  DetailView.swift
//  FridgeFoodApp
//
//  Created by Jaedon Taylor on 11/11/20.
//

import SwiftUI

struct DetailView: View {
    @State var item: FoodItem
    @State var scale: CGFloat = 1.0
    var dateFormatter: DateFormatter {
          let formatter = DateFormatter()
        formatter.dateStyle = .short
          return formatter
      }
    var body: some View {
        
            VStack(spacing: 40) {
                VStack(spacing: 10) {
                Text("Number of \(item.name!) in fridge:")
                    .background(Color.gray)
                    .cornerRadius(5)
                        .scaleEffect(scale)
                   Text("\(item.quantity)")
                        .scaleEffect(scale)
                }
                VStack(spacing: 10){
                if item.quantity > 1 {
                Text("Items expire on:")
                    .background(Color.gray)
                    .cornerRadius(5)
                    .scaleEffect(scale)
                } else {
                    Text("Item expires on: ")
                    .scaleEffect(scale)
                }
                    Text(" \(item.expDate!, formatter: dateFormatter)")
                        .scaleEffect(scale)
                }
                if item.note != "" {
                    Text("Notes: ")
                        .background(Color.gray)
                        .cornerRadius(5)
                        .scaleEffect(scale)
                    Text("\(item.note!)")
                        .scaleEffect(scale)
                } else {
                    Text("")
                }
                Text("")
                    .scaleEffect(scale)
                    .onAppear {
                        let animation = Animation.easeInOut(duration: 0.5)
                        return withAnimation(animation){
                            self.scale = 1.3
                        }
                     
                }
                    
                Spacer()
                
            }
          
            .navigationTitle(item.name!)
        
      
    }
}

