//
//  LoginVC.swift
//  storage assignment
//
//  Created by Promact on 14/02/24.
//

import UIKit

class LoginVC: UIViewController {

    
    @IBOutlet weak var userEmail: UITextField!
    
    @IBOutlet weak var userPassword: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func showAlertForInvalidInput(textField: String) {
            let alert = UIAlertController(title: "Invalid \(textField)", message: "Please enter a valid \(textField).", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
            alert.addAction(okAction)
            present(alert, animated: true, completion: nil)
        }
    
    @IBAction func performLogin(_ sender: Any) {
        if userEmail.text?.isEmpty ?? true {
                    showAlertForInvalidInput(textField: "Email")
                }
                
        if userPassword.text?.isEmpty ?? true {
                    showAlertForInvalidInput(textField: "Password")
                }
        performSegue(withIdentifier: "ToDataListVC", sender: nil)
    }
}

struct Validator {
    static func isValidEmail(_ email: String) -> Bool {
        let emailRegex = #"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$"#
        return NSPredicate(format: "SELF MATCHES %@", emailRegex).evaluate(with: email)
    }

    static func isValidPassword(_ password: String) -> Bool {
        let passwordRegex = #"^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$"#
        return NSPredicate(format: "SELF MATCHES %@", passwordRegex).evaluate(with: password)
    }
}
