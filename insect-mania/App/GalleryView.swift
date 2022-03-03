//
//  GalleryView.swift
//  insect-mania
//
//  Created by Andres Haro on 12/13/21.
//

import SwiftUI

struct GalleryView: View {
  // Properties
  
  @State private var selectedInsect: String = "lion"
  
  let insects: [Insect] = Bundle.main.decode("insects.json")
  let haptics = UIImpactFeedbackGenerator(style: .medium)
  
  // Simple Grid
  // let gridLayout: [GridItem] = [
  //   GridItem(.flexible()),
  //   GridItem(.flexible()),
  //   GridItem(.flexible())
  // ]
  
  // EFFICIENT GRID DEFINITION
  // let gridLayout: [GridItem] = Array(repeating: GridItem(.flexible()), count: 3)
  
  // Grid Layout
  
  @State private var gridLayout: [GridItem] = [GridItem(.flexible())]
  @State private var gridColumn: Double = 3.0
  
  func gridSwitch() {
    gridLayout = Array(repeating: .init(.flexible()), count: Int(gridColumn))
  }
  
  // Body

  var body: some View {
    ScrollView(.vertical, showsIndicators: false) {
      VStack(alignment: .center, spacing: 30) {
        // Image
        
        Image(selectedInsect)
          .resizable()
          .scaledToFit()
          .clipShape(RoundedRectangle(cornerRadius: 20.0))
          .overlay(RoundedRectangle(cornerRadius: 20.0).stroke(Color.white, lineWidth: 8))
        
        // Slider
        
        Slider(value: $gridColumn, in: 2...4, step: 1)
          .padding(.horizontal)
          .onChange(of: gridColumn, perform: { value in
            gridSwitch()
          })
        
        // Grid
        
        LazyVGrid(columns: gridLayout, alignment: .center, spacing: 10) {
          ForEach(insects) { item in
            Image(item.image)
              .resizable()
              .scaledToFit()
              .clipShape(RoundedRectangle(cornerRadius: 10.0))
              .overlay(RoundedRectangle(cornerRadius: 11.0).stroke(Color.white, lineWidth: 1))
              .onTapGesture {
                  selectedInsect = item.image
                haptics.impactOccurred()
              }
          } //: Loop
        } //: Grid
        .animation(.easeIn)
        .onAppear(perform: {
          gridSwitch()
        })
      } //: VStack
      .padding(.horizontal, 10)
      .padding(.vertical, 50)
    } //: Scroll
    .frame(maxWidth: .infinity, maxHeight: .infinity)
    .background(MotionAnimationView())
  }
}

struct GalleryView_Previews: PreviewProvider {
  static var previews: some View {
    GalleryView()
      .previewDevice("iPhone 12 Pro")
  }
}
