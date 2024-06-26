//
//  CategoryHome.swift
//  CollectionSwiftUI
//
//  Created by DREAMWORLD on 11/08/23.
//

import SwiftUI

struct CategoryHome: View {
    
    @EnvironmentObject var modelData: ModelData
    
    var body: some View {
        NavigationSplitView(sidebar: {
            
            List{
                modelData.features[0].image
                                   .resizable()
                                   .scaledToFill()
                                   .frame(height: 200)
                                   .clipped()
                                   .listRowInsets(EdgeInsets())
                
                ForEach(modelData.categories.keys.sorted(), id: \.self) { key in
                    CategoryRow(categoryName: key, items: modelData.categories[key]!)
                }
                .listRowInsets(EdgeInsets())
            }
            .navigationTitle("Featured")
            
        }, detail: {
            Text("Select a Landmark")
        })
    }
}

struct CategoryHome_Previews: PreviewProvider {
    static var previews: some View {
        CategoryHome()
            .environmentObject(ModelData())
    }
}
