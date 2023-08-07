//
//  FavouritsTableViewCell.swift
//  Recipes App
//
//  Created by Ahmed Fekry on 07/08/2023.
//

import UIKit

class FavouritsTableViewCell: UITableViewCell {

    
    @IBOutlet weak var favImage: UIImageView!
    
    @IBOutlet weak var favName: UILabel!
    
    @IBOutlet weak var favHeadline: UITextView!
    
    @IBOutlet weak var favGoldenStar: UIButton!
    
    @IBOutlet weak var favRatelabel: UILabel!
    
    @IBOutlet weak var favTimeLabel: UILabel!
    
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
