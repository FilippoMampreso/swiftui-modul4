//
//  RecipeFeaturedView.swift
//  Recipe List App
//
//  Created by Filippo Mampreso on 25/04/21.
//

import SwiftUI

struct RecipeFeaturedView: View {
    
    @EnvironmentObject var model:RecipeModel
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 0) {
            
            Text("Featured recipe")
                .bold()
                .padding(.leading)
                .padding(.top)
                .font(.largeTitle)
            
        GeometryReader { geo in
        
        TabView {
            
            //Loop through each recipe
            
            ForEach(0..<model.recipes.count) { index in
                
                //Only show those that should be featured
                
                if model.recipes[index].featured {
                    
                   //Recipe Card
                    ZStack {
                        
                        Rectangle()
                            .foregroundColor(.white)
                            
                        VStack(spacing: 0) {
                            
                            Image(model.recipes[index].image)
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                            Text(model.recipes[index].name)
                                .padding()
                            
                        }
                    }
                    .frame(width: geo.size.width - 40, height: geo.size.height - 100, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .cornerRadius(15)
                    .shadow(color: Color(.sRGB, red: 0, green: 0, blue: 0, opacity: 0.5), radius: 5, x: -5, y: 5)
                }
            }
        }
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .automatic))
        .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
        }
            
            VStack(alignment: .leading, spacing: 10) {
                Text("Preparation time:")
                    .font(.headline)
                Text("1 hour")
                Text("Highlights:")
                    .font(.headline)
                Text("Vegetaria")
            }
            .padding([.leading, .bottom])
        
        }
    }
}

struct RecipeFeaturedView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeFeaturedView()
            .environmentObject(RecipeModel())
    }
}
