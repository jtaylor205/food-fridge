//
//  AddRecipeView.swift
//  FridgeFoodApp
//
//  Created by Jaedon Taylor on 11/13/20.
//

import SwiftUI

struct AddRecipeView: View {
    @Environment(\.managedObjectContext) var moc
    @Environment(\.presentationMode) var presentationMode
    @State private var recipeName = ""
    @State private var recipeIng = ""
    @State private var ing = [String]()
    @State private var Fullinstruc = [String]()
    @State private var instruc = ""
    @State private var numberOfIngredient = ""
    @State private var instrucPos: Int = 1
    @State private var recType = ["Breakfast", "Lunch", "Dinner", "Dessert"]
    @State private var chosenType = 0
    var body: some View {
        NavigationView{
            
                Form{
                    Section{
                        TextField("Name of Recipe", text: $recipeName)
                    }
                    Section{
                        Picker("Type of recipe", selection: $chosenType){
                            ForEach(0..<recType.count){
                                Text("\(recType[$0])")
                            }
                        }
                    }
                    Section(header: Text("Add Ingredient")){
                        TextField("Name", text: $recipeIng)
                        if recipeIng != ""{
                        TextField("# of \(recipeIng)", text: $numberOfIngredient)
                        } else {
                        TextField("# of item", text: $numberOfIngredient)
                            .keyboardType(.decimalPad)
                        }
                        Button("Add Ingredient") {
                            let addIngredient = recipeIng.lowercased().trimmingCharacters(in: .whitespacesAndNewlines)
                            let addedIngredient = "\(numberOfIngredient)  \(addIngredient)"
                            guard addedIngredient.count > 0 else {return}
                            ing.insert(addedIngredient, at: 0)
                            recipeIng = ""
                            numberOfIngredient = ""
                        }
                    }
                    Section(header: Text("Instructions")){
                        TextField("Type Instruction", text: $instruc)
                        Button("Add Instruction"){
                            let addedInstruction = "\(instrucPos). \(instruc.lowercased())"
                            let position = instrucPos
                            guard addedInstruction.count > 2 else {return}
                            Fullinstruc.insert(addedInstruction, at: position - 1)
                            instrucPos += 1
                            instruc  = ""
                        }
                    }
                    Section(header: Text("Ingredients")){
                        List(ing, id: \.self){
                            Text($0)
                        }
                    }
                    Section(header: Text("Instructions")){
                        List(Fullinstruc, id: \.self){
                            Text($0)
                        }
                    }
                    Button("Create Recipe"){
                        guard recipeName != "" else {return}
                        let newRecipe = Recipe(context: moc)
                        newRecipe.name = recipeName
                        var newIngredient = ""
                        var newInstruction = ""
                        for ingredient in ing{
                            newIngredient += "\(ingredient) \n"
                            print(newIngredient)
                        }
                        newRecipe.ingredients = newIngredient
                        for instruction in Fullinstruc{
                            newInstruction += "\(instruction) \n"
                        }
                        guard newInstruction != "" else { return}
                        guard newIngredient != "" else {return}
                        newRecipe.instructions = newInstruction
                        newRecipe.recipeType = recType[chosenType]
                        try? self.moc.save()
                        self.presentationMode.wrappedValue.dismiss()
                    }
                   
                }
              
                .navigationTitle("Add Recipe to Fridge")
            
        }
       
    }
    
}

