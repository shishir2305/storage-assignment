//
//  DataListVC.swift
//  storage assignment
//
//  Created by Promact on 14/02/24.
//

import UIKit
import CoreData

class DataListVC: UIViewController {
    var dataList: [Person] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchAndDisplayData()
    }
    
    func fetchAndDisplayData() {
            // Access the managed object context
            guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
                return
            }
            let managedObjectContext = appDelegate.persistentContainer.viewContext

            let fetchRequest: NSFetchRequest<Person> = Person.fetchRequest()

            do {
                let persons = try managedObjectContext.fetch(fetchRequest)
                
                dataList.removeAll()
                dataList.append(contentsOf: persons)

                for person in persons {
                    print(person.id?.uuidString as Any)
                               print("Name: \(person.name ?? "Unknown")")
                               print("Age: \(person.age ?? "Unknown")")
                               print("Email: \(person.email ?? "Unknown")")
                               print("Address: \(person.address ?? "Unknown")")
                               print("Phone Number: \(person.phoneNumber ?? "Unknown")")
                               print("Occupation: \(person.occupation ?? "Unknown")")
                               print("---")
                           }
            } catch {
                print("Failed to fetch data: \(error)")
            }
        print(dataList.count)
        }
    
    
    @IBAction func performAddNewData(_ sender: Any) {
        performSegue(withIdentifier: "ToNewDataVC", sender: nil)
    }
}

extension DataListVC: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DataCell", for: indexPath)
        
        // Access the person object for the current row
        let person = dataList[indexPath.row]
        
        // Set the text of the cell's label to the name of the person
        cell.textLabel?.text = person.name ?? "Unknown"
        
        return cell
    }

    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let selectedPerson = dataList[indexPath.row]
        print(selectedPerson)
        
        performSegue(withIdentifier: "ToUpdateDataVC", sender: selectedPerson)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destVC = segue.destination as! UpdateDataVC
        destVC.person = (sender as! Person)
    }
    
    }
