//
//  CountryRepo.swift
//  MyFirstApp
//
//  Created by Clara Renauro on 1/27/22.
//

import Foundation

class CountryRepo
{
    func getCountries () -> [Country] {
        var countries = [Country]()
        countries.append(Country(image: "camera_btn", name: "US", desc: "Freedom"))
        countries.append(Country(image: "camera_btn", name: "India", desc: "Best Place"))
        countries.append(Country(image: "camera_btn", name: "Australia", desc: "Scary"))
        countries.append(Country(image: "camera_btn", name: "France", desc: "Delicious cheese"))
        
        return countries
    }
}
