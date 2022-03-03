//
//  ContentView.swift
//  insect-mania
//
//  Created by Andres Haro on 12/13/21.
//

import SwiftUI

struct ContentView: View {
  // Properties
  
  let insects: [Insect] = Bundle.main.decode("insects.json")
  let haptics = UIImpactFeedbackGenerator(style: .medium)
  
  @State private var isGridViewActive: Bool = false
  
  @State private var gridLayout: [GridItem] = [ GridItem(.flexible()) ]
  @State private var gridColumn: Int = 1
  @State private var toolbarIcon: String = "square.grid.2x2"
  
  // Functions
  
  func gridSwitch() {
    gridLayout = Array(repeating: .init(.flexible()), count: gridLayout.count % 3 + 1)
    gridColumn = gridLayout.count
    print("Grid Number: \(gridColumn)")
    
    // Toolbar Image
    switch gridColumn {
    case 1:
      toolbarIcon = "square.grid.2x2"
    case 2:
      toolbarIcon = "square.grid.3x2"
    case 3:
      toolbarIcon = "rectangle.grid.1x2"
    default:
      toolbarIcon = "square.grid.2x2"
    }
  }

  var body: some View {

    // Body
    
    NavigationView {
      Group {
        if !isGridViewActive {
          List {
            CoverImageView()
              .frame(height: 300)
              .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
            
            ForEach(insects) { insect in
              NavigationLink(destination: InsectDetailView(insect: insect)) {
                InsectListItemView(insect: insect)
              } //: Link
            } //: Loop
            
          } //: List
        } else {
          ScrollView(.vertical, showsIndicators: false) {
            LazyVGrid(columns: gridLayout, alignment: .center, spacing: 10) {
              ForEach(insects) { insect in
                NavigationLink(destination: InsectDetailView(insect: insect)) {
                  InsectGridItemView(insect: insect)
                } //: Link
              } //: Loop
            } //: Grid
            .padding(10)
            .animation(.easeIn)
          } //: Scroll
        } //: Condition
      } //: Group
      .navigationBarTitle("Insect-Mania", displayMode: .large)
      .toolbar {
        ToolbarItem(placement: .navigationBarTrailing) {
          HStack(spacing: 16) {
            // LIST
            Button(action: {
              print("List view is activated")
              isGridViewActive = false
              haptics.impactOccurred()
            }) {
              Image(systemName: "square.fill.text.grid.1x2")
                .font(.title2)
                .foregroundColor(isGridViewActive ? .primary : .accentColor)
            }
            
            // Grid
            Button(action: {
              print("Grid view is activated")
              isGridViewActive = true
              haptics.impactOccurred()
              gridSwitch()
            }) {
              Image(systemName: toolbarIcon)
                .font(.title2)
                .foregroundColor(isGridViewActive ? .accentColor : .primary)
            }
          } //: HStack
        } //: Buttons
      } //: ToolBar
    } //: Navigation
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
      .previewDevice("iPhone 12 Pro")
  }
}
