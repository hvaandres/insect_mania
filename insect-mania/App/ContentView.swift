//
//  ContentView.swift
//  insect-mania
//
//  Created by Andres Haro on 12/13/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        // Properties
        
        let insects: [Insect] =
            Bundle.main.decode("insects.json")
        
        //Body
        
        NavigationView{
            List {
                CoverImageView()
                    .frame( height: 300)
                    .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                
                ForEach(insects) { insect in
                    AnimalListItemView(insect: insect)
                    
                }
            } // List
            
            .navigationBarTitle("Insect-Manía", displayMode: .large)
        }
    }
}
    

// MARK: - PREVIEW

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
      .previewDevice("iPhone 13 Pro")
  }
}
