//
//  ReciepsDetailsViewController.swift
//  Recipes App
//
//  Created by Ahmed Fekry on 05/08/2023.
//

import UIKit
import Kingfisher

class ReciepsDetailsViewController: UIViewController {

    var recipNameLabelHolder : String?
    var recipImageViewHolder : String?
    var ratingLabelHolder : String?
    var timeLabelHolder : String?
    var headlineTextViewHolder : String?
    var descriptionTextViewHolder : String?
    var ingrediantsTextViewHolder : [String]?
    var idHolder : String?
    
    
    
    
    
    @IBOutlet weak var recipNameLabel: UILabel!
    
    @IBOutlet weak var recipImageView: UIImageView!
    
    @IBOutlet weak var recipGoldenStar: UIButton!
    
    @IBOutlet weak var ratingLabel: UILabel!
    
    @IBOutlet weak var timeLabel: UILabel!
    
    @IBOutlet weak var addToFavouritsButton: UIButton!
    
    @IBAction func addToFavouritsButton(_ sender: Any) {
        if self.addToFavouritsButton.isSelected == false{
            self.addToFavouritsButton.isSelected = true
        }else {
            self.addToFavouritsButton.isSelected = false
        }
        
        if addToFavouritsButton.isSelected == true {
            self.addToFavouritsButton.setImage(UIImage(systemName: "heart.fill"), for: .normal)
            CoreDataManager.saveToCoreData(ratings: Int32((ratingLabelHolder! as NSString).intValue), descriptione:descriptionTextViewHolder! , headline: headlineTextViewHolder! , id: idHolder!, image: recipImageViewHolder ?? "place", name: recipNameLabelHolder!, time: timeLabelHolder!, ingredients: ingrediantsTextViewHolder!)
        }else {
            self.addToFavouritsButton.setImage(UIImage(systemName: "heart"), for: .normal)
            CoreDataManager.deleteFromCoreData(recipeID: idHolder!)
        }
        
    }
    
    @IBOutlet weak var headlineTextView: UITextView!
    
    @IBOutlet weak var descriptionTextView: UITextView!
    
    @IBOutlet weak var ingrediantsTextView: UITextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var favRecips = CoreDataManager.fetchFromCoreData()
        for currentRecip in favRecips {
            if  idHolder == currentRecip.id {
                self.addToFavouritsButton.setImage(UIImage(systemName: "heart.fill"), for: .normal)
                self.addToFavouritsButton.isSelected = true
                break
            }
        }
        
        recipNameLabel.text = self.recipNameLabelHolder
        //Image********************
        if self.ratingLabelHolder != "0"{
            ratingLabel.text = self.ratingLabelHolder
            self.ratingLabel.isHidden = false
            self.recipGoldenStar.isHidden = false
        }
        
        timeLabel.text = self.timeLabelHolder
        headlineTextView.text = self.headlineTextViewHolder
        descriptionTextView.text = self.headlineTextViewHolder
        ingrediantsTextView.text = self.ingrediantsTextViewHolder?.description
        recipImageView.kf.setImage(with: URL(string: self.recipImageViewHolder ?? "place"))
        
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
