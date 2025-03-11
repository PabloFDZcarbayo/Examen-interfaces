/
//  MainView.swift
//  Figma Films
//
//  Created by Pablo  on 11/3/25.
//

import SwiftUI

struct MainView: View {
    @StateObject private var itemViewModel = ItemViewModel()
    
    var body: some View {
        NavigationStack{
            VStack{
                    Text("Electronica")
            
                ScrollView{
                    LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())]) {
                        ForEach(itemViewModel.items) { item in
                            NavigationLink(destination: DetailView(item: item)) {
                                CardView(item: item, itemViewModel : itemViewModel)
                            }
                        }
                    }
                }
            }
        }
        .onAppear{
            Task{
                await itemViewModel.GetItems()
            }
        }
    }
}
struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
