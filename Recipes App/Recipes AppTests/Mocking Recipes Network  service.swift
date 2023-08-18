//
//  Mocking Recipes Network  service.swift
//  Recipes AppTests
//
//  Created by Ahmed Fekry on 28/08/2023.
//

import Foundation
@testable import Recipes_App

class MockingNetworkManager : NetworkService {
    
    
    
    static var isConnected : Bool?
    static let mockRecipesJsonResponse : [Recips] =
          [Recips(recipe_rating: 4,
                  recipe_descriptione: "There’s nothing like the simple things in life - the smell of freshly cut grass, sitting outside on a nice sunny day, spending time with friends and family. Well here is a recipe that delivers simple culinary pleasures - some nice fresh fish with a crispy crust, crunchy potato wedges and some delightfully sweet sugar snap peas flavoured with cooling mint. Slip into something comfortable and relax into a delicious dinner!",
                  recipe_headline: "with Sweet Potato Wedges and Minted Snap Peas",
                  recipe_id: "533143aaff604d567f8b4571",
                  recipe_image: "https://img.hellofresh.com/w_1080,f_webp,q_auto/hellofresh_s3/image/zartes-kokos-fischfilet-76aba609.jpg",
                  recipe_name: "Crispy Fish Goujons ",
                  recipe_time: "PT35M",
                  recipe_ingredients: [
                    "375g Sweet Potatoes",
                    "1 Tsp Paprika",
                    "2 Tbsps Parmesan Cheese",
                    "1 Lemon",
                    "A Few Sprigs Thyme",
                    "25g Panko Breadcrumbs",
                    "1 Tbsp Butter",
                    "2 Cod Fillets",
                    "150g Sugar Snap Peas",
                    "A Few Sprigs Mint",
                    "75ml Sour Cream"
                                    ]
                 ), Recips(recipe_rating: 4,
                           recipe_descriptione: "There’s nothing like the simple things in life - the smell of freshly cut grass, sitting outside on a nice sunny day, spending time with friends and family. Well here is a recipe that delivers simple culinary pleasures - some nice fresh fish with a crispy crust, crunchy potato wedges and some delightfully sweet sugar snap peas flavoured with cooling mint. Slip into something comfortable and relax into a delicious dinner!",
                           recipe_headline: "with Sweet Potato Wedges and Minted Snap Peas",
                           recipe_id: "533143aaff604d567f8b4571",
                           recipe_image: "https://img.hellofresh.com/w_1080,f_webp,q_auto/hellofresh_s3/image/zartes-kokos-fischfilet-76aba609.jpg",
                           recipe_name: "Crispy Fish Goujons ",
                           recipe_time: "PT35M",
                           recipe_ingredients: [
                             "375g Sweet Potatoes",
                             "1 Tsp Paprika",
                             "2 Tbsps Parmesan Cheese",
                             "1 Lemon",
                             "A Few Sprigs Thyme",
                             "25g Panko Breadcrumbs",
                             "1 Tbsp Butter",
                             "2 Cod Fillets",
                             "150g Sugar Snap Peas",
                             "A Few Sprigs Mint",
                             "75ml Sour Cream"
                                             ]
                          )
          ]
    
    init(connected : Bool) {
        MockingNetworkManager.isConnected = connected
    }
    
    static func getRecips<T>(apiUrl: String?, complition: @escaping ([T]?) -> Void) where T : Decodable, T : Encodable {
        if isConnected == true {
            var resRecipes = mockRecipesJsonResponse
            complition((resRecipes as! [T]))
        }else{
            
            complition(nil)
        }
    }
    
}

