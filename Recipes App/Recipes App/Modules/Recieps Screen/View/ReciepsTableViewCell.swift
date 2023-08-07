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
    
    var favRecipe:(()->())?
    
    @IBAction func addToFavouritsButtonBehavior(_ sender: Any) {
        favRecipe?()
        /*  if addToFavouritsButton.isSelected == false{
            addToFavouritsButton.isSelected = true
        }else {
            addToFavouritsButton.isSelected = false
        }
        if addToFavouritsButton.isSelected == true {
            self.addToFavouritsButton.setImage(UIImage(systemName: "heart.fill"), for: .normal)
        }else {
            self.addToFavouritsButton.setImage(UIImage(systemName: "heart"), for: .normal)
           
            
        }*/
        
        
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
