//
//  FavouritsViewController.swift
//  Recipes App
//
//  Created by Ahmed Fekry on 07/08/2023.
//

import UIKit

class FavouritsViewController: UIViewController {

    @IBOutlet weak var emptyFavImageView: UIImageView!
    @IBOutlet weak var favTableView: UITableView!
    var FavRecipViewModel : FavouritsViewModel?
    var favouritsArr: [Recips]?
    override func viewDidLoad() {
        super.viewDidLoad()

        FavRecipViewModel = FavouritsViewModel()
        FavRecipViewModel?.bindingFavRecips = { [self] in
            favouritsArr = FavRecipViewModel?.observableFavRecips
            DispatchQueue.main.async {
                self.favTableView.reloadData()
            }
            
        }
        FavRecipViewModel?.getLovedRecips()
        if favouritsArr?.count == 0 {
            self.favTableView.isHidden = true
            self.emptyFavImageView.image = UIImage(named: "fav")
            
        }
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
// favourits table view
extension FavouritsViewController : UITableViewDelegate , UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return favouritsArr!.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = (tableView.dequeueReusableCell(withIdentifier: "FavouritsTableViewCell", for: indexPath) as? FavouritsTableViewCell)!
        
        
        cell.favName.text = favouritsArr?[indexPath.row].name
        cell.favHeadline.text = favouritsArr?[indexPath.row].headline
        cell.favRatelabel.text = "\(favouritsArr?[indexPath.row].ratings ?? 0)"
        if cell.favRatelabel.text == "0"{
            cell.favRatelabel.isHidden = true
            cell.favGoldenStar.isHidden = true
        }else {
            cell.favRatelabel.isHidden = false
            cell.favGoldenStar.isHidden = false
        }
        cell.favTimeLabel.text = favouritsArr?[indexPath.row].time
        
       return cell 
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 280
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == UITableViewCell.EditingStyle.delete {
            let alert = UIAlertController(title: "Delete", message: "Remove \(favouritsArr?[indexPath.row].name ?? "recipe") From your favourits?", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default , handler: { [weak self] action in
                CoreDataManager.deleteFromCoreData(recipeID: self!.favouritsArr![indexPath.row].id!)
                self!.favouritsArr?.remove(at: indexPath.row)
                self!.favTableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.automatic)
                if self!.favouritsArr?.count == 0 {
                    self?.favTableView.isHidden = true
                }
                
            }))
            alert.addAction(UIAlertAction(title: "Cancel", style: .cancel))
            self.present(alert, animated: true, completion: nil)
            
        }
    }
    
    
    
    
    
    
}
