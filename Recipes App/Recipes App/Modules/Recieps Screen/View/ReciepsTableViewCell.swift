//
//  ReciepsTableViewCell.swift
//  Recipes App
//
//  Created by Ahmed Fekry on 05/08/2023.
//

import UIKit

class ReciepsTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var reciepImage: UIImageView!
    
    @IBOutlet weak var receipName: UILabel!
    
    @IBOutlet weak var reciepHeadLine: UITextView!
    
    @IBOutlet weak var reciepGoldenButton: UIButton!
    
    @IBOutlet weak var reciepRatingLabel: UILabel!
    
    @IBOutlet weak var reciepTimeLabel: UILabel!
 
    @IBOutlet weak var addToFavouritsButton: UIButton!
    
    
    @IBAction func addToFavouritsButtonBehavior(_ sender: Any) {
        
        if addToFavouritsButton.isSelected == true {
            self.addToFavouritsButton.setImage(UIImage(systemName: "heart"), for: .normal)
            self.addToFavouritsButton.isSelected = false
        }else {
            self.addToFavouritsButton.setImage(UIImage(systemName: "heart.fill"), for: .normal)
            self.addToFavouritsButton.isSelected = true
            
        }
        
        
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
