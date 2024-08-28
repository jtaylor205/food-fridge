//
//  ContentView.swift
//  FridgeFoodApp
//
//  Created by Jaedon Taylor on 11/10/20.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(entity: FoodItem.entity(), sortDescriptors: [ NSSortDescriptor(keyPath: \FoodItem.expDate, ascending: true)
    ]) var foods: FetchedResults<FoodItem>
    @State private var addingFood = false
    @State var foodtyper: String
    var dateFormatter: DateFormatter {
          let formatter = DateFormatter()
        formatter.dateStyle = .short
          return formatter
      }
    
    var body: some View {
        
                    List{
                        ForEach(foods, id: \.self) { i in
                           
                            if i.foodType == foodtyper {
                                NavigationLink(destination: DetailView(item: i)) {
                                HStack{
                                            Text(i.name ?? "Unknown Food Item")
                                        Spacer()
                                        Text("Exp. Date: \(i.expDate!, formatter: dateFormatter)")
                                }
                            }
                            }
                        }
                        .onDelete(perform: delete)
                        .frame(height: 55)
                       
                    }
                    
                    .navigationTitle("\(foodtyper)")
            
        
    }
    func delete(at offsets: IndexSet){
        for offset in offsets {
            let deletedFood = foods[offset]
            moc.delete(deletedFood)
        }
        try? moc.save()
    }
}


