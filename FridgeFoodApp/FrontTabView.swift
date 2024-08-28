////
////  FrontTabView.swift
////  FridgeFoodApp
////
////  Created by Jaedon Taylor on 5/22/23.
////
//
//import SwiftUI
//import Foundation
//
//struct TabItem: Identifiable {
//    var id = UUID()
//    var text: String
//    var icon: String
//    var tab: Tab
//  
//}
//
//
//var TabItems = [
//    TabItem(text: "Fridge", icon: "refrigerator", tab: .Fridge),
//    TabItem(text: "Recipes", icon: "list.bullet", tab: .Recipe),
//    TabItem(text: "Lists", icon: "list.clipboard", tab: .List),
//]
//
//enum Tab: String{
//    case Fridge
//    case Recipe
//    case List
//}
//
//
//struct FrontTabView: View {
//    @State var selectedTab: Tab = .Fridge
//    var body: some View {
//        ZStack {
//           
//            }.frame(maxWidth: .infinity, maxHeight: .infinity)
//            HStack{
//                ForEach(TabItems) { item in
//                    Button{
//                        withAnimation{
//                        selectedTab = item.tab
//                        }
//                    } label: {
//                        VStack(spacing: 0){
//                            Image(systemName: item.icon)
//                                .symbolVariant(.fill)
//                                .font(.body.bold())
//                                .frame(width:44, height: 29)
//                            Text(item.text)
//                                .font(.caption2)
//                                .lineLimit(1)
//                        }
//                        .frame(maxWidth: .infinity)
//                    }.foregroundStyle(selectedTab == item.tab ? .primary : .secondary)
//                }
//                
//            }
//            .padding(.top, 14)
//            .frame(height: 88, alignment: .top)
//            .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 34, style: .continuous))
//            .frame(maxHeight: .infinity, alignment: .bottom)
//            .ignoresSafeArea()        }
//    }
//}
//
//struct FrontTabView_Previews: PreviewProvider {
//    static var previews: some View {
//        FrontTabView()
//    }
//}
