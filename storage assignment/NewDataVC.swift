//
//  NewDataVC.swift
//  storage assignment
//
//  Created by Promact on 14/02/24.
//

import UIKit
import CoreData

class NewDataVC: UIViewController {
    
    @IBOutlet weak var name: UITextField!
    
    @IBOutlet weak var age: UITextField!
    
    @IBOutlet weak var email: UITextField!
    
    @IBOutlet weak var address: UITextField!
    
    @IBOutlet weak var phoneNumber: UITextField!
    
    @IBOutlet weak var occupation: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
    @IBAction func saveData(_ sender: Any) {
        guard let name = name.text, !name.isEmpty,
              let age = age.text, !age.isEmpty,
              let email = email.text, !email.isEmpty,
              let address = address.text, !address.isEmpty,
              let phoneNumber = phoneNumber.text, !phoneNumber.isEmpty,
              let occupation = occupation.text, !occupation.isEmpty else {
            return
        }
        
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        let managedObjectContext = appDelegate.persistentContainer.viewContext
        
        let person = Person(context: managedObjectContext)
        
        person.name = name
        person.age = age
        person.email = email
        person.address = address
        person.phoneNumber = phoneNumber
        person.occupation = occupation
        
        do {
            try managedObjectContext.save()
            print("Data saved successfully")
        } catch {
            print("Failed to save data: \(error)")
        }
        
        performSegue(withIdentifier: "DisplayDetailsFromNewData", sender: person)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destVC = segue.destination as! DisplayDetailsVC
        
        destVC.person = (sender as! Person)
    }
    
}
