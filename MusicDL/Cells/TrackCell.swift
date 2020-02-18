//
//  TrackCell.swift
//
//  Copyright © 2020 Ignatovskiy Nikita. All rights reserved.
//

import UIKit

protocol TrackCellDelegate
{
  func cancelTapped(_ cell: TrackCell)
  func downloadTapped(_ cell: TrackCell)
  func pauseTapped(_ cell: TrackCell)
  func resumeTapped(_ cell: TrackCell)
}

class TrackCell: UITableViewCell
{
  static let identifier = "TrackCell"
  
  @IBOutlet weak var artistLabel: UILabel!
  @IBOutlet weak var cancelButton: UIButton!
  @IBOutlet weak var downloadButton: UIButton!
  @IBOutlet weak var pauseButton: UIButton!
  @IBOutlet weak var progressLabel: UILabel!
  @IBOutlet weak var progressView: UIProgressView!
  @IBOutlet weak var titleLabel: UILabel!
  
  var delegate: TrackCellDelegate?
  
  @IBAction func cancelTapped(_ sender: AnyObject)
  {
    delegate?.cancelTapped(self)
  }
  
  @IBAction func downloadTapped(_ sender: AnyObject)
  {
    delegate?.downloadTapped(self)
  }
  
  @IBAction func pauseOrResumeTapped(_ sender: AnyObject)
  {
    if(pauseButton.titleLabel?.text == "Pause")
    {
      delegate?.pauseTapped(self)
    } else {
      delegate?.resumeTapped(self)
    }
  }
  
  func configure(track: Track, downloaded: Bool, download: Download?)
  {
    titleLabel.text = track.name
    artistLabel.text = track.artist
    
    var showDownloadControls = false
    
    if let download = download
    {
      showDownloadControls = true
      
      let title = download.isDownloading ? "Pause" : "Resume"
      pauseButton.setTitle(title, for: .normal)
      
      progressLabel.text = download.isDownloading ? "Downloading..." : "Paused"
    }
    
    pauseButton.isHidden = !showDownloadControls
    cancelButton.isHidden = !showDownloadControls
    
    progressView.isHidden = !showDownloadControls
    progressLabel.isHidden = !showDownloadControls
    
    selectionStyle = downloaded ? UITableViewCell.SelectionStyle.gray : UITableViewCell.SelectionStyle.none
    downloadButton.isHidden = downloaded || showDownloadControls
  }
  
  func updateDisplay(progress: Float, totalSize : String) {
    progressView.progress = progress
    progressLabel.text = String(format: "%.1f%% of %@", progress * 100, totalSize)
  }
}
