//
//  InstagramCell.swift
//  FBInsta
//
//  Created by Naveed ul Aziz on 27/09/2021.
//

import UIKit
import AVFoundation

class InstagramCell: UITableViewCell {

    @IBOutlet weak var feedImageView: UIImageView!
    @IBOutlet weak var feedVideoPlayerView: UIView!
    @IBOutlet weak var hashTagsLabel: UILabel!
    
    var cellMedia : MediaData? {
        didSet {
            
            let c = ".mp4"
            let objc = cellMedia?.media_url!

            let containsVideo: Bool = objc?.range(of: c, options: .caseInsensitive) != nil
            // true
            if containsVideo {
                self.sendSubviewToBack(feedImageView)
                self.bringSubviewToFront(feedVideoPlayerView)
                
                let url = URL(string: objc!)!
                let avPlayer = AVPlayer(playerItem: AVPlayerItem(url: url))
                let avPlayerLayer = AVPlayerLayer(player: avPlayer)
                avPlayerLayer.frame = feedVideoPlayerView.bounds
                feedVideoPlayerView.layer.insertSublayer(avPlayerLayer, at: 0)
                avPlayer.play()

            } else {
                self.bringSubviewToFront(feedImageView)
                self.sendSubviewToBack(feedVideoPlayerView)
                self.feedImageView.sd_setImage(with: URL(string: (cellMedia?.media_url)!))
            }
            
            self.hashTagsLabel.text = cellMedia?.caption
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    
}
