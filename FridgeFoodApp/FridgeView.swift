//
//  FridgeView.swift
//  FridgeFoodApp
//
//  Created by Jaedon Taylor on 11/11/20.
//

import SwiftUI

struct FridgeView: View {
    @State private var foodTypes = ["Meat", "Dairy", "Bread", "Produce"]
    @State private var recipeTypes = ["Breakfast", "Lunch", "Dinner", "Dessert"]
    @State private var addingFood = false
    @State private var gradientProduce = ["red", "green"]
    @Environment(\.managedObjectContext) var moc
    var body: some View {
        NavigationView{
            VStack(alignment: .leading) {
                ScrollView(.horizontal){
                   
                    HStack(spacing: 10) {
                        ForEach(0..<foodTypes.count){ i in
                            
                            NavigationLink(destination: ContentView(foodtyper: foodTypes[i])) {
                               
                                ZStack {
                                    Image(foodTypes[i])
                                        .resizable()
                                        .frame(width: 150, height: 100)
                                        .offset(x: -70)
                                        .frame(width: 300, height: 150)
                                        .background(Color.white)
                                        .cornerRadius(8)
                                    Text("\(foodTypes[i])")
                                        .offset(x: 90, y: 50)
                                        .font(.title)
                                        
                                            .frame(width: 300, height: 150)
                                        
                                            .foregroundColor(.black)
                                        .shadow(radius: 5)
                                            .border(Color.gray, width: 4)
                                        .cornerRadius(8)
                                        
                                }
                            
                        }
                        
                        }
                    }
                }
                Text("Your Recipes")
                    .font(.title)
                    .offset(x: 15)
                    ScrollView(.horizontal){
                       
                        HStack(spacing: 10) {
                            ForEach(0..<recipeTypes.count){ i in
                                
                                NavigationLink(destination: RecipesView(recipeType: recipeTypes[i])) {
                                   
                                    ZStack {
                                        Image("\(recipeTypes[i])")
                                            .resizable()
                                            .frame(width: 150, height: 100)
                                            .offset(x: -70)
                                            
                                            .frame(width: 300, height: 150)
                                            .background(Color.white)
                                            .cornerRadius(8)
                                        Text("\(recipeTypes[i])")
                                            .offset(x: 90, y: 50)
                                            .font(.title)
                                            
                                                .frame(width: 300, height: 150)
                                            
                                                .foregroundColor(.black)
                                            .shadow(radius: 5)
                                                .border(Color.gray, width: 4)
                                            .cornerRadius(8)
                                            
                                    }
                                
                            }
                            
                            }
                        }
                    }
                Text("Your Lists")
                    .font(.title)
                    .offset(x: 15)
                NavigationLink(destination: ShoppingList()) {
                   
                    ZStack {
                        Image(systemName: "list.bullet")
                            
                            .resizable()
                            .foregroundColor(Color.gray)
                            .frame(width: 90, height: 60)
                            .offset(x: -90)
                            
                            .frame(width: 350, height: 150)
                            .background(Color.white)
                            .cornerRadius(8)
                        Text("Shopping List")
                            .offset(x: 50, y: 50)
                            .font(.title)
                            
                                .frame(width: 350, height: 150)
                            
                                .foregroundColor(.black)
                            .shadow(radius: 5)
                                .border(Color.gray, width: 4)
                            .cornerRadius(8)
                            
                    }
                
            }
                
                Spacer()
                    
                    
                    
                    
                    
                    
                    .navigationTitle("My Fridge")
                .navigationBarItems(trailing: Button(action: {
                    self.addingFood.toggle()
                }, label: {
                    Image(systemName: "plus.circle")
                }))
                .sheet(isPresented: $addingFood) {
                    TabViews()
                        .environment(\.managedObjectContext, self.moc)
            }
            }
        }
        
    }
}


struct FridgeView_Previews: PreviewProvider {
    static var previews: some View {
        FridgeView()
    }
}
