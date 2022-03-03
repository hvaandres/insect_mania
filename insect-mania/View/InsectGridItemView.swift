//
//  InsectGridItemView.swift
//  insect-mania
//
//  Created by Andres Haro on 3/2/22.
//

import SwiftUI


struct InsectGridItemView: View {
  // MARK: - PROPERTIES
  
  let insect: Insect

  // MARK: - BODY

  var body: some View {
    Image(insect.image)
      .resizable()
      .scaledToFit()
      .cornerRadius(12)
  }
}

// MARK: - PREVIEW

struct InsectGridItemView_Previews: PreviewProvider {
  static let insects: [Insect] = Bundle.main.decode("insects.json")
  
  static var previews: some View {
    InsectGridItemView(insect: insects[0])
      .previewLayout(.sizeThatFits)
      .padding()
  }
}
