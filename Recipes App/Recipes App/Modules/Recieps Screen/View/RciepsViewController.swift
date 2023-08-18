//
//  RciepsViewController.swift
//  Recipes App
//
//  Created by Ahmed Fekry on 05/08/2023.
//

import UIKit
import CoreData
import Kingfisher

//import CoreDataManager.swift

class RciepsViewController: UIViewController  {

    @IBOutlet weak var recipsTableView: UITableView!
    
    @IBAction func logoutButton(_ sender: Any) {
        let loginStatus = 0
        UserDefaults.standard.set(loginStatus, forKey: "loginStatus")
        let logOut = self.storyboard?.instantiateViewController(withIdentifier: "ViewController") as! ViewController
        let navigationController = UINavigationController(rootViewController: logOut)
        navigationController.modalPresentationStyle = .fullScreen
        self.present(navigationController, animated: true)
    }
    
    @IBAction func favouritsButton(_ sender: Any) {
        let favouritsVC = self.storyboard?.instantiateViewController(withIdentifier: "FavouritsViewController") as! FavouritsViewController
        
        self.navigationController?.pushViewController(favouritsVC, animated: true)
        
        
    }


    
    
    
    var recipsViewModelObject : RecipsViewModel?
    var recipsArr : [Recips]?
    override func viewDidLoad() {
        super.viewDidLoad()
        recipsViewModelObject = RecipsViewModel()
        let recipsUrl = "https://api.npoint.io/43427003d33f1f6b51cc"
        recipsViewModelObject?.getAllRecips(url: recipsUrl)
        recipsViewModelObject?.bindingRecips = { [self] in
            
            recipsArr = recipsViewModelObject?.ObservableRecips
            
            DispatchQueue.main.async {
                self.recipsTableView.reloadData()
            }
            
            
            
        }
        
        recipsViewModelObject?.getAllRecips(url: recipsUrl)
        

        
        
    }
    override func viewDidAppear(_ animated: Bool) {
       self.recipsTableView.reloadData()

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
// recieps TableView Extention

extension RciepsViewController : UITableViewDelegate , UITableViewDataSource {
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return recipsArr?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = (tableView.dequeueReusableCell(withIdentifier: "ReciepsTableViewCell", for: indexPath) as? ReciepsTableViewCell)!
       // let entity = NSEntityDescription.entity(forEntityName: "LocalRecips", in: managedContext)
        
        cell.receipName.text = recipsArr?[indexPath.row].name
        cell.reciepImage.kf.setImage(with: URL(string: recipsArr?[indexPath.row].image ?? "place"))
        cell.reciepHeadLine.text = recipsArr?[indexPath.row].headline
        cell.reciepRatingLabel.text = "\(recipsArr?[indexPath.row].ratings ?? 0)"
        if cell.reciepRatingLabel.text == "0"{
            cell.reciepRatingLabel.isHidden = true
            cell.reciepGoldenButton.isHidden = true
        }else {
            cell.reciepRatingLabel.isHidden = false
            cell.reciepGoldenButton.isHidden = false
        }
        cell.reciepTimeLabel.text = recipsArr?[indexPath.row].time
        // save favourite button state
        let favRecips = CoreDataManager.fetchFromCoreData()
        if favRecips.count == 0 {
            cell.addToFavouritsButton.isSelected = false
            cell.addToFavouritsButton.setImage(UIImage(systemName: "heart"), for: .normal)
        }
        for favRecip in favRecips {
            if recipsArr?[indexPath.row].id == favRecip.id {
                cell.addToFavouritsButton.isSelected = true
                cell.addToFavouritsButton.setImage(UIImage(systemName: "heart.fill"), for: .normal)
                break
            } else {
                cell.addToFavouritsButton.isSelected = false
                cell.addToFavouritsButton.setImage(UIImage(systemName: "heart"), for: .normal)
            }
        }
      
        //COREDATA NEW
        cell.favRecipe = { [unowned self] in
            
            if cell.addToFavouritsButton.isSelected == false{
                cell.addToFavouritsButton.isSelected = true
            }else {
                cell.addToFavouritsButton.isSelected = false
            }
            if cell.addToFavouritsButton.isSelected {
                
                cell.addToFavouritsButton.setImage(UIImage(systemName: "heart.fill"), for: .normal)
                
                CoreDataManager.saveToCoreData ( ratings: recipsArr?[indexPath.row].ratings ?? 0, descriptione: (recipsArr?[indexPath.row].description)!, headline: (recipsArr?[indexPath.row].headline)!, id: (recipsArr?[indexPath.row].id)!, image: (recipsArr?[indexPath.row].image)!, name: (recipsArr?[indexPath.row].name)!, time: (recipsArr?[indexPath.row].time)!, ingredients: (recipsArr?[indexPath.row].ingredients)!)
                    
            } else {
                cell.addToFavouritsButton.setImage(UIImage(systemName: "heart"), for: .normal)
                CoreDataManager.deleteFromCoreData(recipeID:  self.recipsArr![indexPath.row].id ?? "0")
                
                
            }
            
        }
        
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 280
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailsVC = self.storyboard?.instantiateViewController(withIdentifier: "ReciepsDetailsViewController") as! ReciepsDetailsViewController
        detailsVC.recipNameLabelHolder = self.recipsArr?[indexPath.row].name
        detailsVC.headlineTextViewHolder = self.recipsArr?[indexPath.row].headline
        detailsVC.timeLabelHolder = self.recipsArr?[indexPath.row].time
        detailsVC.descriptionTextViewHolder = self.recipsArr?[indexPath.row].description
        detailsVC.ingrediantsTextViewHolder = self.recipsArr?[indexPath.row].ingredients
        detailsVC.ratingLabelHolder = "\(recipsArr?[indexPath.row].ratings ?? 0)"
        detailsVC.idHolder = self.recipsArr?[indexPath.row].id
        detailsVC.recipImageViewHolder = self.recipsArr?[indexPath.row].image
      

        self.navigationController?.pushViewController(detailsVC, animated: true)
    }
    
    
    
    
}
