//
//  VideoModel.swift
//  insect-mania
//
//  Created by Andres Haro on 2/28/22.
//

import Foundation

struct Video: Codable, Identifiable {
    let id: String
    let name: String
    let headline: String
    
    // COmputed Property
    
    var thumbnail: String {
        "video-\(id)"
    }
    
}
