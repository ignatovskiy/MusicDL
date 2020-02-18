//
//  Track.swift
//
//  Copyright © 2020 Ignatovskiy Nikita. All rights reserved.
//

import Foundation.NSURL

class Track
{
  let artist: String
  let index: Int
  let name: String
  let previewURL: URL
  
  var downloaded = false
  
  init(name: String, artist: String, previewURL: URL, index: Int)
  {
    self.name = name
    self.artist = artist
    self.previewURL = previewURL
    self.index = index
  }
}
