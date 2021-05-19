//
//  RecipeHighLights.swift
//  Recipe List App
//
//  Created by Filippo Mampreso on 19/05/21.
//

import SwiftUI

struct RecipeHighLights: View {
    
    var allHighlighs = ""
    
    init(highlights: [String]) {
        
        //Loop through the highlights and build the string
        for index in 0..<highlights.count {
            if index == highlights.count - 1 {
                allHighlighs += highlights[index]
            } else {
                allHighlighs += highlights[index] + ", "
            }
        }
    }
    
    var body: some View {
        
        Text(allHighlighs)
    }
}

struct RecipeHighLights_Previews: PreviewProvider {
    static var previews: some View {
        RecipeHighLights(highlights: ["Test", "Test2", "Test3"])
    }
}
