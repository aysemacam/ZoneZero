//
//  ViewController.swift
//  ZoneZero
//
//  Created by Akçay Holding on 28.03.2023.
//

import UIKit
import CoreData

class ViewController: UIViewController {
    
    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var passwordAgainTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        view.addGestureRecognizer(gestureRecognizer)
    }
    
    @IBAction func registerPressed(_ sender: UIButton) {
        if nameTextField.text != nil && emailTextField.text != nil && passwordTextField.text != nil && passwordTextField.text == passwordAgainTextField.text {
            let appDelegete = UIApplication.shared.delegate as! AppDelegate
            let context = appDelegete.persistentContainer.viewContext
            let userInfo = NSEntityDescription.insertNewObject(forEntityName: "UserInfo", into: context)
            userInfo.setValue(nameTextField.text, forKey: "name")
            userInfo.setValue(passwordTextField.text, forKey: "password")
            do {
              try context.save()
                
            } catch {
                print("error")
            }
            
            
            
            performSegue(withIdentifier: "RegisterToLogin", sender: self)
            
            
        }
        
    }
    @objc func hideKeyboard() {
        view.endEditing(true)
    }
    

}

