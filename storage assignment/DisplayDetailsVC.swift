//
//  DisplayDetailsVC.swift
//  storage assignment
//
//  Created by Promact on 15/02/24.
//

import UIKit

class DisplayDetailsVC: UIViewController {

    var person: Person?
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var ageLabel: UILabel!
    
    @IBOutlet weak var emailLabel: UILabel!
    
    @IBOutlet weak var addressLabel: UILabel!
    
    @IBOutlet weak var phoneNumberLabel: UILabel!
    
    @IBOutlet weak var occupationLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        displayDetails()
    }
    
    func displayDetails() {
            guard let person = person else {
                return
            }
            
            nameLabel.text = person.name
            ageLabel.text = person.age
            emailLabel.text = person.email
            addressLabel.text = person.address
            phoneNumberLabel.text = person.phoneNumber
            occupationLabel.text = person.occupation
        }
}
