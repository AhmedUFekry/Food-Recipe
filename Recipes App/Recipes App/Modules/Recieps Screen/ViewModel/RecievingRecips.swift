//
//  RecievingRecips.swift
//  Recipes App
//
//  Created by Ahmed Fekry on 05/08/2023.
//

import Foundation

protocol getRecips {
    func getAllRecips()
}

class RecipsViewModel : getRecips{
  
    
    
    var bindingRecips:(()->())?
    
    var ObservableRecips : [Recips]? {
        didSet {
            bindingRecips!()
        }
    }
    
    let recipsUrl = "https://api.npoint.io/43427003d33f1f6b51cc"
    func getAllRecips() {
        NetworkManager.getRecips(apiUrl: recipsUrl) { [weak self] data in
            self?.ObservableRecips = data

        }
    }
    
}
