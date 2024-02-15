//
//  UpdateDataVC.swift
//  storage assignment
//
//  Created by Promact on 15/02/24.
//

import UIKit

class UpdateDataVC: UIViewController {
    
    var person: Person?
    
    @IBOutlet weak var uuidLabel: UILabel!
    
    @IBOutlet weak var nameLabel: UITextField!
    
    @IBOutlet weak var ageLabel: UITextField!
    
    @IBOutlet weak var emailLabel: UITextField!
    
    @IBOutlet weak var addressLabel: UITextField!
    
    @IBOutlet weak var phoneNumberLabel: UITextField!
    
    @IBOutlet weak var occupationLabel: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(person as Any)
        showFilledData()
    }
    
    func showFilledData() {
        if let person = person {
                    uuidLabel.text = person.id?.uuidString // Assuming 'id' is the property storing UUID
                    nameLabel.text = person.name
                    ageLabel.text = person.age
                    emailLabel.text = person.email
                    addressLabel.text = person.address
                    phoneNumberLabel.text = person.phoneNumber
                    occupationLabel.text = person.occupation
        }
    }
    
    
    @IBAction func performUpdate(_ sender: Any) {
        guard let person = person else {
                    return
                }
                
                // Update the 'Person' object's properties with the new values entered by the user
                person.name = nameLabel.text
                person.age = ageLabel.text
                person.email = emailLabel.text
                person.address = addressLabel.text
                person.phoneNumber = phoneNumberLabel.text
                person.occupation = occupationLabel.text
                
                // Save the changes to Core Data
                do {
                    try person.managedObjectContext?.save()
                    print("Data updated successfully")
                } catch {
                    print("Failed to update data: \(error)")
                }
        
        performSegue(withIdentifier: "DisplayDetailsFromUpdatedData", sender: person)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destVC = segue.destination as! DisplayDetailsVC
        destVC.person = (sender as! Person)
    }
}
