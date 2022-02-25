//
//  ExternalWebLinkView.swift
//  insect-mania
//
//  Created by Andres Haro on 2/25/22.
//

import SwiftUI

struct ExternalWebLinkView: View {
    
    // Properties
    
    let insect: Insect
    
    // Body
    
    
    var body: some View {
        GroupBox {
            HStack {
                Image(systemName: "global")
                Text("Wikipedia")
                Spacer()
                
                Group {
                    Image(systemName: "arrow.up.right.square")
                    
                    Link(insect.name, destination: (URL(string: insect.link) ?? URL(string: "https://wikipedia.org"))!)
                }
                
                .foregroundColor(.accentColor)
            } //Hstack
        }
    }
}

struct ExternalWebLinkView_Previews: PreviewProvider {
    static let insects: [Insect] = Bundle.main.decode("insects.json")
    static var previews: some View {
        ExternalWebLinkView(insect: insects[0])
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
