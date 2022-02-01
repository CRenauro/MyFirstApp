//
//  Country.swift
//  MyFirstApp
//
//  Created by Clara Renauro on 1/27/22.
//

import Foundation
class Country // MODEL
{
    var countryImage: String
    var countryName: String
    var countryDesc: String
    
    init(image: String, name: String, desc: String) {
        countryName = name
        countryDesc = desc
        countryImage = image
    }
}
