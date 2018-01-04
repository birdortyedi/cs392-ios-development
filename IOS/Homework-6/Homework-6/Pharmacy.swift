//
//  Pharmacy.swift
//  Homework-6 for CS392 IOS Development Course @ Ozyegin University
//
//  Created by Furkan Kınlı on 03/12/17.
//  Copyright © 2017 Furkan Kınlı. All rights reserved.
//

import Foundation

class Pharmacy: NSObject {

    let pharmacyName : String
    let pharmacyAddress : String
    let pharmacyPhoneNumber : String
    let pharmacyID : String
    let pharmacyRegionName : String
    
    init(pharmacyName : String, pharmacyAddress : String, pharmacyPhoneNumber : String) {
        self.pharmacyID = ""
        self.pharmacyName = pharmacyName
        self.pharmacyAddress = pharmacyAddress
        self.pharmacyPhoneNumber = pharmacyPhoneNumber
        self.pharmacyRegionName = ""
    }
    
    init(pharmacyID : String, pharmacyRegionName : String) {
        self.pharmacyID = pharmacyID
        self.pharmacyName = ""
        self.pharmacyAddress = ""
        self.pharmacyPhoneNumber = ""
        self.pharmacyRegionName = pharmacyRegionName
    }
}
