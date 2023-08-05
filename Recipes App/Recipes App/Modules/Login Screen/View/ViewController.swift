//
//  ViewController.swift
//  Recipes App
//
//  Created by Ahmed Fekry on 03/08/2023.
//

import UIKit

class ViewController: UIViewController {

    
    @IBAction func loginButton(_ sender: Any) {
        
        let RciepsVC = self.storyboard?.instantiateViewController(withIdentifier: "RciepsViewController") as! RciepsViewController
        
        self.navigationController?.pushViewController(RciepsVC, animated: true)
        
        
        
    }
    
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
        
        
    }


}

