//
//  ShoppingList.swift
//  FridgeFoodApp
//
//  Created by Jaedon Taylor on 11/14/20.
//

import SwiftUI

struct ShoppingList: View {
    @FetchRequest(entity: ShoppingItem.entity(), sortDescriptors: []) var list: FetchedResults<ShoppingItem>
    @Environment(\.managedObjectContext) var moc
    var body: some View {
        List{
            ForEach(list, id: \.self){ i in
                if i.nameQuantity != ""{
                Text("\(i.nameQuantity!)")
                }
            }.onDelete(perform: delete)
        }
            .navigationTitle("Shopping List")
        .navigationBarItems(trailing: EditButton())
    }
    func delete(at Offsets: IndexSet){
        for offset in Offsets{
          let deletedItem = list[offset]
            moc.delete(deletedItem)
        }
        try? moc.save()
    }
}

struct ShoppingList_Previews: PreviewProvider {
    static var previews: some View {
        ShoppingList()
    }
}
