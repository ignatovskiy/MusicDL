//
//  Download.swift
//
//  Copyright © 2020 Ignatovskiy Nikita. All rights reserved.
//

import Foundation

class Download
{
  var isDownloading = false
  var progress: Float = 0
  var resumeData: Data?
  var task: URLSessionDownloadTask?
  var track: Track
  
  init(track: Track) {
    self.track = track
  }
}
