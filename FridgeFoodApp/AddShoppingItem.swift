//
//  AddShoppingItem.swift
//  FridgeFoodApp
//
//  Created by Jaedon Taylor on 11/14/20.
//

import SwiftUI

struct AddShoppingItem: View {
    @Environment(\.managedObjectContext) var moc
    @Environment(\.presentationMode) var presentationMode
    @State private var itemName = ""
    @State private var itemQuantity = ""
    var body: some View {
        Form{
            Section{
                TextField("Name of Item", text: $itemName)
            }
            Section{
                TextField("Quantity of Item", text: $itemQuantity)
            }
            Section{
                Button("Add to List"){
                    let newItem = ShoppingItem(context: moc)
                    newItem.nameQuantity = "\(itemQuantity) \(itemName)"
                    try? self.moc.save()
                    self.presentationMode.wrappedValue.dismiss()
                }
            }
        }.navigationTitle("Add to Shopping List")
    }
}

struct AddShoppingItem_Previews: PreviewProvider {
    static var previews: some View {
        AddShoppingItem()
    }
}
