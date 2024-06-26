//
//  ViewController.swift
//  Recipes App
//
//  Created by Ahmed Fekry on 03/08/2023.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var userName: UITextField!
    @IBOutlet weak var password: UITextField!
    
    @IBAction func loginButton(_ sender: Any) {
        
        
        let userName = userName.text ?? "username"
        let password = password.text ?? "password"
        let authenticated = verifyUser(userName: userName, password: password)
        if authenticated {
            let loginStatus = 1
            UserDefaults.standard.set(loginStatus, forKey: "loginStatus")
            let Login = self.storyboard?.instantiateViewController(withIdentifier: "RciepsViewController") as! RciepsViewController
            let navigationController = UINavigationController(rootViewController: Login)
            navigationController.modalPresentationStyle = .fullScreen
            self.present(navigationController, animated: true)
        }else{
            let loginStatus = 0
            UserDefaults.standard.set(loginStatus, forKey: "loginStatus")
            self.showToast(message: "uncorrect mail or password ", seconds: 2.0)
            
        }
        
        
    }
    
    func verifyUser(userName: String , password : String) -> Bool{
        var authentication : Bool?
        if userName == "ahmed" && password == "123456" {
            authentication = true
        }else {
            authentication = false
        }
        
        return authentication!
    }
    
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
        
        
    }
    
    func showToast(message : String, seconds: Double){
        
            let alert = UIAlertController(title: nil, message: message, preferredStyle: .actionSheet)
            alert.view.backgroundColor = .orange
            alert.view.layer.cornerRadius = 15
            self.present(alert, animated: true)
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + seconds) {
                alert.dismiss(animated: true)
            }
        }

    
    
    
    
    
    
    
    


}

