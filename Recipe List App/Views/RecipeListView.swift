//
//  ContentView.swift
//  Recipe List App
//
//  Created by Christopher Ching on 2021-01-14.
//

import SwiftUI

struct RecipeListView: View {
    
    @EnvironmentObject var model:RecipeModel
    
    var body: some View {
        
        NavigationView {
            
            ScrollView {
            
                LazyVStack (alignment: .leading) {
                
                    Text("Recipe List")
                        .bold()
                        .padding(.top)
                        .font(.largeTitle)
                    
                ForEach(model.recipes) { r in
                    
                    NavigationLink(
                        destination: RecipeDetailView(recipe:r),
                        label: {
                            
                            // MARK: Row item
                            HStack(spacing: 20.0) {
                                Image(r.image)
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 50, height: 50, alignment: .center)
                                    .clipped()
                                    .cornerRadius(5)
                                Text(r.name)
                            }
                        })
                }
                .navigationBarHidden(true)
                }
                .padding(.leading)
            }
        }
    }
}

struct RecipeListView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeListView()
            .environmentObject(RecipeModel())
    }
}
