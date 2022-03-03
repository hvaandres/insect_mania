//
//  AnimalListItemView.swift
//  insect-mania
//
//  Created by Andres Haro on 12/17/21.
//

import SwiftUI

struct InsectListItemView: View {
    
  // Properties
    
    let insect: Insect
    
  // Body
    
    var body: some View {
        HStack(alignment: .center, spacing: 16) {
            Image(insect.image)
                .resizable()
                .scaledToFit()
                .frame(width: 90, height: 90)
                .clipShape(
                    RoundedRectangle(cornerRadius: 12)
                )
            
            VStack(alignment: .leading, spacing: 8) {
                Text(insect.name)
                    .font(.title2)
                    .fontWeight(.heavy)
                    .foregroundColor(.accentColor)
                
                Text(insect.headline)
                    .font(.footnote)
                    .multilineTextAlignment(.leading)
                    .lineLimit(2)
                    .padding(.trailing, 8)
            }
        }
    }
  
  
}
// MARK: - PREVIEW

struct InsectListItemView_Previews: PreviewProvider {
    static let insects: [Insect] = Bundle.main.decode("insects.json")
    static var previews: some View {
        InsectListItemView(insect: insects[1])
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
