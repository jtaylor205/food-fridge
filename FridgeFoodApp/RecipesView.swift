//
//  RecipesView.swift
//  FridgeFoodApp
//
//  Created by Jaedon Taylor on 11/13/20.
//

import SwiftUI

struct RecipesView: View {
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(entity: Recipe.entity(), sortDescriptors: []) var recipes: FetchedResults<Recipe>
    @State var recipeType: String
    var body: some View {
        List{
            ForEach(recipes, id: \.self){ i in
                if i.recipeType == recipeType{
                    NavigationLink(destination: RecipeDetailView(recipe: i)){
                    Text(i.name!)
                    }
                }
            }.onDelete(perform: delete)
        }
        .navigationTitle("Your Recipes")
    }
    func delete(at offsets: IndexSet){
        for offset in offsets {
            let deletedFood = recipes[offset]
            moc.delete(deletedFood)
        }
        try? moc.save()
    }
}

