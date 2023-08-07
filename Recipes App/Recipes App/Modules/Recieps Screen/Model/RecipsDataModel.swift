//
//  RecipsDataModel.swift
//  Recipes App
//
//  Created by Ahmed Fekry on 05/08/2023.
//

import Foundation

class Recips : Codable{
    
    var id : String?
    var name : String?
    var time : String?
    var image : String?
    var ratings : Int32?
    var headline : String?
    var description : String?
    var ingredients : [String]
    
    init(recipe_rating: Int32, recipe_descriptione: String, recipe_headline: String, recipe_id: String , recipe_image: String , recipe_name: String , recipe_time: String , recipe_ingredients: [String]) {
        
        ratings = recipe_rating
        description = recipe_descriptione
        headline = recipe_headline
        id = recipe_id
        image = recipe_image
        name = recipe_name
        time = recipe_time
        ingredients = recipe_ingredients
    }
    
}
