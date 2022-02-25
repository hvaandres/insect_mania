//
//  InsetFactView.swift
//  insect-mania
//
//  Created by Andres Haro on 2/23/22.
//

import SwiftUI

struct InsetFactView: View {
    
    // Properties
    
    let insect: Insect
    
    var body: some View {
        GroupBox {
            TabView {
                ForEach(insect.fact, id: \.self) { item in
                    Text(item)
                }
                
            }//: Tab
            .tabViewStyle(PageTabViewStyle())
            .frame( idealWidth: 180, maxWidth: 380, minHeight: 150)
            
        }//: Box
    }
}

struct InsetFactView_Previews: PreviewProvider {
    static let insects: [Insect] =
    Bundle.main.decode("insects.json")
    static var previews: some View {
        InsetFactView(insect: insects[0])
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
