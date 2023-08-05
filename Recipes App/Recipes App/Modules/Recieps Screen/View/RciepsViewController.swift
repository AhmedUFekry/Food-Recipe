//
//  RciepsViewController.swift
//  Recipes App
//
//  Created by Ahmed Fekry on 05/08/2023.
//

import UIKit

class RciepsViewController: UIViewController  {

    @IBOutlet weak var recipsTableView: UITableView!
    
    @IBAction func logoutButton(_ sender: Any) {
        
        
    }
    
    @IBAction func favouritsButton(_ sender: Any) {
        
        
    }
    
    var recipsViewModelObject : RecipsViewModel?
    var recipsArr : [Recips]?
    override func viewDidLoad() {
        super.viewDidLoad()
        recipsViewModelObject = RecipsViewModel()
        recipsViewModelObject?.getAllRecips()
        recipsViewModelObject?.bindingRecips = { [self] in
            
            recipsArr = recipsViewModelObject?.ObservableRecips
            
            DispatchQueue.main.async {
                self.recipsTableView.reloadData()
            }
            
            
            
        }
        
        recipsViewModelObject?.getAllRecips()
        

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
        cell.receipName.text = recipsArr?[indexPath.row].name
        cell.reciepHeadLine.text = recipsArr?[indexPath.row].headline
       
        if recipsArr?[indexPath.row].ratings != nil{
            cell.reciepRatingLabel.text = "\(recipsArr?[indexPath.row].ratings ?? 0)"
            cell.reciepRatingLabel.isHidden = false
            cell.reciepGoldenButton.isHidden = false
        }
        cell.reciepTimeLabel.text = recipsArr?[indexPath.row].time
        
        
        
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
        detailsVC.ingrediantsTextViewHolder = self.recipsArr?[indexPath.row].ingredients.description
        detailsVC.ratingLabelHolder = "\(recipsArr?[indexPath.row].ratings ?? 0)"

        self.navigationController?.pushViewController(detailsVC, animated: true)
    }
    
    
    
    
}
