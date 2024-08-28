//
//  TabView.swift
//  FridgeFoodApp
//
//  Created by Jaedon Taylor on 11/13/20.
//

import SwiftUI

struct TabViews: View {
    var body: some View {
       TabView {
            AddFoodView().tabItem ({
                Image(systemName: "pencil.tip")
                Text("Add Food")
            }).tag(0)
        AddRecipeView().tabItem ({
            Image(systemName: "book.fill")
            Text("Add Recipe")
        }).tag(1)
        AddShoppingItem().tabItem({
            Image(systemName: "list.bullet")
            Text("Add to Shopping List")
            
        })
        }
    }
}

struct TabViews_Previews: PreviewProvider {
    static var previews: some View {
        TabViews()
    }
}
