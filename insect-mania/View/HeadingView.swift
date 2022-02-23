//
//  HeadingView.swift
//  insect-mania
//
//  Created by Andres Haro on 2/22/22.
//

import SwiftUI

struct HeadingView: View {
    
    // Properties
    
    var headingImage: String
    var headingText: String
    
    // Body
    var body: some View {
        HStack {
            Image(systemName: headingImage)
                .foregroundColor(.accentColor)
                .imageScale(.large)
            
            Text(headingText)
                .font(.title3)
                .fontWeight(.bold)
        }
        .padding(.vertical)
    }
}

struct HeadingView_Previews: PreviewProvider {
    static var previews: some View {
        HeadingView(headingImage: "photo.on.rectangle.angled", headingText: "Real Insect Pictures" )
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
