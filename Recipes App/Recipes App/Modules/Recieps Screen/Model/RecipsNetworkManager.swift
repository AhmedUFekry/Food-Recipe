//
//  RecipsNetworkManager.swift
//  Recipes App
//
//  Created by Ahmed Fekry on 05/08/2023.
//

import Foundation
import UIKit

protocol NetworkService {
    static func getRecips<T : Codable>(apiUrl:String? , complition :@escaping ([T]?) -> Void)
}


class NetworkManager : NetworkService{
    static func getRecips<T : Codable>(apiUrl:String? , complition :@escaping ([T]?) -> Void){
        let url = URL(string: apiUrl!)
        let req = URLRequest(url: url!)
        let session = URLSession(configuration: URLSessionConfiguration.default)
        let task = session.dataTask(with: req) { data, response, error in
            
            do{
                if data != nil {
                    let result = try JSONDecoder().decode([T]?.self, from: data!)
                    complition(result)
                    
                }
                
            }catch let error{
                complition(nil)
                print(error.localizedDescription)
            }
        }
        task.resume()
    }
}

