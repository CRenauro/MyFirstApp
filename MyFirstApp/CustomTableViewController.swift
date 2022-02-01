//
//  CustomTableViewController.swift
//  MyFirstApp
//
//  Created by Clara Renauro on 1/27/22.
//

import UIKit

 //VIEWController with Icons and Labels
class CustomTableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    
    var countries = CountryRepo().getCountries()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        countries.count
    }


    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CountryCell", for: indexPath) as! CustomTableViewCell
        
        let rowData = countries[indexPath.row]
        cell.topLabel.text = rowData.countryName
        cell.bottomLabel.text = rowData.countryDesc
        cell.customImageView.image = UIImage(named: rowData.countryImage)
        
        
        return cell
        
    
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
