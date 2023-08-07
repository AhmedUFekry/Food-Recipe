//
//  CoreDataOperator.swift
//  Recipes App
//
//  Created by Ahmed Fekry on 07/08/2023.
//

import Foundation
import CoreData
import UIKit



class CoreDataManager {
    static var context : NSManagedObjectContext?
    static var appDelegate : AppDelegate?
    
    
    static func saveToCoreData(ratings : Int32 , descriptione: String , headline : String , id :String , image : String , name : String , time : String , ingredients : [String])
    {
        appDelegate = UIApplication.shared.delegate as? AppDelegate
        
        context = appDelegate?.persistentContainer.viewContext
        
        guard let myContext = context else{return}
        
        let entity = NSEntityDescription.entity(forEntityName: "LocalRecips", in: myContext)
        
        guard let myEntity = entity else{return}
        
        do{
            
            
            let favoriteRecips = NSManagedObject(entity: myEntity, insertInto: myContext)
            
            
            favoriteRecips.setValue(ratings, forKey: "ratings")
            favoriteRecips.setValue(descriptione, forKey: "descriptione")
            favoriteRecips.setValue(headline, forKey: "headline")
            favoriteRecips.setValue(id, forKey: "id")
            favoriteRecips.setValue(image, forKey: "image")
            favoriteRecips.setValue(name, forKey: "name")
            favoriteRecips.setValue(time, forKey: "time")
            favoriteRecips.setValue(ingredients, forKey: "ingredients")


            print("Saved Successfully")
            
            
            try myContext.save()
            
        }catch let error{
            
            print(error.localizedDescription)
        }
    }
    
    static func deleteFromCoreData(recipeID :String)
    {
        appDelegate = UIApplication.shared.delegate as? AppDelegate
        
        context = appDelegate?.persistentContainer.viewContext
        
        do{
            let fetch = NSFetchRequest<NSManagedObject>(entityName: "LocalRecips")
            let predictt = NSPredicate(format: "id == %@" , recipeID)
            
            fetch.predicate = predictt
            
            let favRecipe = try context?.fetch(fetch)
            
            guard let item = favRecipe else {return}
            guard let itemFirst = item.first else {return}
            
             context?.delete(itemFirst)
            
            try context?.save()
            
            print("Deleted Succussfully")
            
        }catch let error
        {
            print(error.localizedDescription)
        }
    }
    
    
    static func fetchFromCoreData() ->[Recips]
    {
        appDelegate = UIApplication.shared.delegate as? AppDelegate
        
        context = appDelegate?.persistentContainer.viewContext
        
        
        let fetch = NSFetchRequest<NSManagedObject>(entityName: "LocalRecips")
        
        var arrayOfFavRcipe : [Recips] = []
        
        do{
            
            
            
            let favRecips = try context?.fetch(fetch)
            
            guard let recipe = favRecips else{return []}
            
            for item in recipe
            {
                let recipeRatings = item.value(forKey: "ratings")
                let recipeDescriptione = item.value(forKey: "descriptione")
                let recipeHeadline = item.value(forKey: "headline")
                let recipeId = item.value(forKey: "id")
                let recipeImage = item.value(forKey: "image")
                let recipeName = item.value(forKey: "name")
                let recipeTime = item.value(forKey: "time")
                let recipeIngredients = item.value(forKey: "ingredients")

                
                var recipes = Recips(recipe_rating: recipeRatings as! Int32, recipe_descriptione: recipeDescriptione as! String, recipe_headline: recipeHeadline as! String, recipe_id: recipeId as! String, recipe_image: recipeImage as! String, recipe_name: recipeName as! String, recipe_time: recipeTime as! String , recipe_ingredients: recipeIngredients as! [String])
                
                arrayOfFavRcipe.append(recipes)
            }
            
        }catch let error
        {
            print(error.localizedDescription)
        }
        return arrayOfFavRcipe
    }

    
    
}
