//
//  CoverImageView.swift
//  insect-mania
//
//  Created by Andres Haro on 12/14/21.
//

import SwiftUI

struct CoverImageView: View {
    
    // Mark: Properties
    
    // Mark: Body
    var body: some View {
        TabView{
            ForEach(/*@START_MENU_TOKEN@*/0 ..< 5/*@END_MENU_TOKEN@*/) { item in
                Image("cover_ant")
                    .resizable()
                .scaledToFit()
            } //: Loop
        } //: Tab
        .tabViewStyle(PageTabViewStyle())
        
    }
}

// Mark: Preview

struct CoverImageView_Previews: PreviewProvider {
    static var previews: some View {
        CoverImageView()
            .previewLayout(.fixed(width: 400, height: 300))
    }
}
