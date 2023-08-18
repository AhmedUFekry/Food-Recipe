//
//  RecievingRecips.swift
//  Recipes App
//
//  Created by Ahmed Fekry on 05/08/2023.
//

import Foundation

protocol getRecips {
    func getAllRecips(url : String)
}

class RecipsViewModel : getRecips{
  
    
    
    var bindingRecips:(()->())?
    
    var ObservableRecips : [Recips]? {
        didSet {
            guard bindingRecips != nil else { return }
            bindingRecips!()
        }
    }
    
    let recipsUrl = "https://api.npoint.io/43427003d33f1f6b51cc"
    func getAllRecips(url : String) {
        NetworkManager.getRecips(apiUrl: url) { [weak self] data in
            self?.ObservableRecips = data

        }
    }
    
}
