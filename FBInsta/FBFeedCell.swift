//
//  FBFeedCell.swift
//  FBInsta
//
//  Created by Asif Habib on 17/09/2021.
//

import UIKit

class FBFeedCell: UITableViewCell {
    
    
    
    @IBOutlet weak var zeroheightConstraint : NSLayoutConstraint!
    @IBOutlet weak var nineSixteenConstrains : NSLayoutConstraint!
    @IBOutlet weak var feedImage : UIImageView!
    @IBOutlet weak var feedText : UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
