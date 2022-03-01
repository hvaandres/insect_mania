//
//  VideoListView.swift
//  insect-mania
//
//  Created by Andres Haro on 12/13/21.
//

import SwiftUI

struct VideoListView: View {
    
    // Properties
    
   @State var videos: [Video] = Bundle.main.decode("videos.json")
    
    let hapticImpact = UIImpactFeedbackGenerator(style: .medium)
    
    // Body
    
    var body: some View {
        NavigationView {
            List {
                ForEach(videos) { item in
                    NavigationLink(destination: VideoPlayerView(videoSelected: item.id, videoTitle: item.name)) {
                        VideoListItemView(video: item)
                            .padding(.vertical, 6)
                    }
                }//: Loop
            
          } //:List
            
            .listStyle(InsetGroupedListStyle())
            .navigationBarTitle("Videos", displayMode: .inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        
                        videos.shuffle()
                        hapticImpact.impactOccurred()
                        
                    }) {
                        Image(systemName: "arrow.2.squarepath")
                    }
                }
            }
        } //:Navigation
    }
}

struct VideoListView_Previews: PreviewProvider {
    static var previews: some View {
        VideoListView()
            .previewDevice("iPhone 13 Pro")
    }
}
