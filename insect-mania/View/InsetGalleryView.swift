//
//  InsetGalleryView.swift
//  insect-mania
//
//  Created by Andres Haro on 2/22/22.
//

import SwiftUI

struct InsetGalleryView: View {
    // Properties
    
    let insect: Insect
    
    // Body
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
        
        HStack(alignment: .center, spacing: 15){
            ForEach(insect.gallery, id: \.self) { item in
                Image(item) 
                    .resizable()
                    .scaledToFit()
                    .frame(height: 200)
                    .cornerRadius(12)
            } // The end of the Loop
        } // The end of the HSTACK
     } // The end of the Scroll
   }
}

struct InsetGalleryView_Previews: PreviewProvider {
    static let insects: [Insect] =
    Bundle.main.decode("insects.json")
    
    static var previews: some View {
        InsetGalleryView(insect: insects[0])
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
