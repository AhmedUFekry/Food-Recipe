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
    var ratings : Int?
    var headline : String?
    var description : String?
    var ingredients : [String]
    
}
