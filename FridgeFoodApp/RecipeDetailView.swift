//
//  RecipeView.swift
//  FridgeFoodApp
//
//  Created by Jaedon Taylor on 11/14/20.
//

import SwiftUI

struct RecipeDetailView: View {
    @State var recipe: Recipe
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(entity: FoodItem.entity(), sortDescriptors: [ NSSortDescriptor(keyPath: \FoodItem.expDate, ascending: true)
    ]) var foods: FetchedResults<FoodItem>
    
    @State private var foodsInFridge = [String]()
    @State private var foodsNotInFridge = [String]()
    @State private var itemAdded = false
    var body: some View {
        let seperateIng = recipe.ingredients?.components(separatedBy: "\n")
        let seperateInstruc = recipe.instructions?.components(separatedBy: "\n")
      
        NavigationView {
            VStack(alignment: .leading) {
                Form{
                    Section(header: Text("Ingredients in fridge")){
                    ForEach(foodsInFridge, id: \.self){ i in
                        Text("\(i)")
                    }
                    }
                    Section(header: Text("Ingredients Not in Fridge")){
                        ForEach(foodsNotInFridge, id: \.self){
                        i in
                            if i != ""{
                       Text("\(i)")
                            }
                    }
                        Button("Add items to shopping list"){
                            for i in foodsNotInFridge{
                            let newItem = ShoppingItem(context: moc)
                            newItem.nameQuantity = "\(i)"
                            try? moc.save()
                            itemAdded = true
                            }
                        }
                               
                    }
                    Section(header: Text("Instructions")){
                        ForEach(seperateInstruc!, id: \.self){ i in
                            if i != ""{
                       Text("\(i)")
                            }
                        }
                    }
                }
                
            }
          
          
        }.onAppear{
            for i in seperateIng!{
                for food in foods{
                    if i.lowercased().contains(food.name!.lowercased()){
                        foodsInFridge.insert(i, at: 0)
                       
                    }
                }
                if foodsInFridge.contains(i) == false {
                foodsNotInFridge.insert(i, at: 0)
                }
            }
            
           
        }.alert(isPresented: $itemAdded){
            Alert(title: Text("Item Added to Shopping list"), dismissButton: .default(Text("OK")))
        }
        
        .navigationTitle(recipe.name!)
        

    }
    
   

}

