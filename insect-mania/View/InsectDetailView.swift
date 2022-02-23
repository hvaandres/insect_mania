//
//  InsectDetailView.swift
//  insect-mania
//
//  Created by Andres Haro on 2/22/22.
//

import SwiftUI

struct InsectDetailView: View {
    // Properties
    
    let insect: Insect
    
    var body: some View{
        ScrollView(.vertical, showsIndicators: false) {
            VStack(alignment: .center, spacing: 20){
                // Hero Image
                Image(insect.image)
                    .resizable()
                    .scaledToFit()
                // Title
                Text(insect.name.uppercased())
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .multilineTextAlignment(.center)
                    .padding(.vertical, 8)
                    .foregroundColor(.primary)
                    .background(
                        Color.accentColor
                            .frame(height: 6)
                            .offset(y: 24)
                    )
                
                // Headline
                Text(insect.headline)
                    .font(.headline)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.accentColor)
                    .padding(.horizontal)
                
                // Gallery
                Group {
                    HeadingView(headingImage: "photo.on.rectangle.angled", headingText: "Real Insect Pictures")
                    
                    InsetGalleryView(insect: insect)
                    
                }
                
                .padding(.horizontal)
                
                // Facts
                // Description
                // Map
                // Link
            } // Vstack
            
            .navigationBarTitle("Lear more about \(insect.name)",
                                displayMode: .inline)
        }
    }
}

struct InsectDetailView_Previews: PreviewProvider {
    
    static let insects: [ Insect ] =
    Bundle.main.decode("insects.json")
    
    static var previews: some View {
        NavigationView {
        InsectDetailView(insect: insects[0])
        }
        .previewDevice("iPhone 13 Pro")
    }
}
