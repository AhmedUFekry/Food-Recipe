//
//  FavouritsViewModel.swift
//  Recipes App
//
//  Created by Ahmed Fekry on 07/08/2023.
//

import Foundation
import CoreData
protocol getFavouritRecips {
    func getLovedRecips()
}

class FavouritsViewModel : getFavouritRecips{
  
    
    
    var bindingFavRecips:(()->())?
    
    var observableFavRecips : [Recips]? {
        didSet {
            bindingFavRecips!()
        }
    }
    
    
    func getLovedRecips() {
        
        observableFavRecips = CoreDataManager.fetchFromCoreData()
      

        }
    }
    

