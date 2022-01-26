//
//  SimpleTableViewController.swift
//  MyFirstApp
//
//  Created by Clara Renauro on 1/26/22.
//

import UIKit

class SimpleTableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

   
    @IBOutlet weak var carTableView: UITableView!
    
    
    let cars = ["Tesla", "Ford", "Honda", "Mercedes", "Audi", "Lexus", "Nissan", "Toyota", "BMW", "Dodge", "Land Rover", "Volvo", "Mazda", "Subaru", "Rolls Royce", "Jeep", "Lincoln", "Kia", "Cadillac", "Volkswagon", "Alfa Romeo"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        carTableView.dataSource = self
        
        //for clicks and user interaction
        carTableView.delegate = self
        // Do any additional setup after loading the view.
    }
    // Return the number of rows for the table.
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return cars.count
    }

    // Provide a cell object for each row.
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       // Fetch a cell of the appropriate type.
       let cell = tableView.dequeueReusableCell(withIdentifier: "CarCell", for: indexPath)
       
       // Configure the cell’s contents.
//       cell.textLabel!.text = "Cell text"
        cell.textLabel?.text = cars[indexPath.row]
        
       return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        print(cars[indexPath.row])
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
