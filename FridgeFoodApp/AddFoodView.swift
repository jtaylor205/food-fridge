//
//  AddFoodView.swift
//  FridgeFoodApp
//
//  Created by Jaedon Taylor on 11/10/20.
//

import SwiftUI

struct AddFoodView: View {
    @Environment(\.managedObjectContext) var moc
    @Environment(\.presentationMode) var presentationMode
    @State private var foodName = ""
    @State private var foodDate = Date()
    @State private var typeSelected = 1
    @State private var foodTypes = ["Meat", "Dairy", "Bread", "Produce"]
    @State private var itemNotes = ""
    @State private var number = ""
    
    var body: some View {
       
        
        
               
        NavigationView {
            
            VStack {
                Form{
                           
                            Section{
                                TextField("Name of Food", text: $foodName)
                            }
                    Section{
                        TextField("Quantity", text: $number)
                            .keyboardType(.decimalPad)
                    }
                            Section{
                                Picker("Type Of Food", selection: $typeSelected){
                                    ForEach(0..<foodTypes.count) {
                                        Text("\(foodTypes[$0])")
                                    }
                                }
                                .pickerStyle(SegmentedPickerStyle())
                            }
                            Section{
                                DatePicker("Expiration Date", selection: $foodDate, displayedComponents: .date)
                                    
                            }
                         
                            
                            Section{
                                TextField("Specific Notes For your item", text: $itemNotes)
                            }
                        
                       
                        Button(action: {
                            addTheFood()
                        }) {
                            Text("Add To Food Fridge")
                               
                               
                                }
                }
             
                
            }
            .navigationTitle("Add Item to Fridge")
           
        }
               
        
           

        
    }
    func addTheFood() {
        if foodName != "" && foodTypes[typeSelected] != "" && number != "" {
            let newfood = FoodItem(context: moc)
            newfood.name = foodName
            newfood.expDate = foodDate
            newfood.quantity = Int16(number) ?? 1
            newfood.foodType = foodTypes[typeSelected]
            newfood.note = itemNotes
            try? self.moc.save()
            self.presentationMode.wrappedValue.dismiss()
        }
    }
}

