//
//  LogInViewController.swift
//  ZoneZero
//
//  Created by Akçay Holding on 28.03.2023.
//

import UIKit
import CoreData


class LogInViewController: UIViewController {
    
    @IBOutlet weak var nameText: UITextField!
    @IBOutlet weak var passwordText: UITextField!
    @IBOutlet weak var checkBoxImageOne: UIImageView!
    @IBOutlet weak var checkBoxImageTwo: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       


    }
    
    @IBAction func checkBoxOne(_ sender: UIButton) {
   
    }
    @IBAction func checkBoxTwo(_ sender: UIButton) {
        setImage()
    }
    @IBAction func loginPressed(_ sender: UIButton) {
        getData()
    }
    
    func getData() {
        
        let appDelegete = UIApplication.shared.delegate as! AppDelegate
        let contex = appDelegete.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "UserInfo")
        fetchRequest.returnsObjectsAsFaults = false
        do {
            let results = try contex.fetch(fetchRequest)
            for result in results as! [NSManagedObject] {
                let name = result.value(forKey: "name") as? String
                let password = result.value(forKey: "password") as? String
                
                if nameText.text == name && passwordText.text == password {
                    performSegue(withIdentifier: "loginToMovieList", sender: self)
                    
                } else {
                    let alert = UIAlertController(title: "Error", message: "name/password wrong", preferredStyle: UIAlertController.Style.alert)
                    let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default)
                    alert.addAction(okButton)
                    self.present(alert, animated: true)
                }
                
            }
            
        } catch {
          
        }
        
    }
    func setImage() {
        checkBoxImageOne.image?.setValue(UIImage(), forKeyPath: "checkBoxTwo")
    }
 
    
}
