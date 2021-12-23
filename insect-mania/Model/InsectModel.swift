//
//  InsectModel.swift
//  insect-mania
//
//  Created by Andres Haro on 12/17/21.
//


import SwiftUI

struct Insect: Codable, Identifiable {
  let id: String
  let name: String
  let headline: String
  let description: String
  let link: String
  let image: String
  let gallery: [String]
  let fact: [String]
    
}

