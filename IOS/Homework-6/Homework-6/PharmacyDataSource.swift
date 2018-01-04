//
//  PharmacyDataSource.swift
//  Homework-6 for CS392 IOS Development Course @ Ozyegin University
//
//  Created by Furkan Kınlı on 03/12/17.
//  Copyright © 2017 Furkan Kınlı. All rights reserved.
//

import Foundation

@objc protocol PharmacyDataDelegate {
    @objc optional func loadPharmacyList()
    @objc optional func loadPharmacyDetails()
}

class PharmacyDataSource: NSObject {
    var pharmacyArray : [Pharmacy] = []
    var pharmacyDetailArray : [Pharmacy] = []
    var delegate : PharmacyDataDelegate?
    
    func loadList() {
        pharmacyArray.removeAll()
        let networkSession = URLSession.shared
        var request = URLRequest(url: URL(string: "http://test.imobilecode.com/ozyegin/api/eczane")!)
        
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let dataTask = networkSession.dataTask(with: request) { (data, response, error) in
            print("Data downloaded")
            
            let jsonReadable = NSString(data: data!, encoding: String.Encoding.utf8.rawValue)
            print(jsonReadable!)
            
            do {
                let jsonPharmacyArray = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers) as! NSArray
                
                for var pharmacy in jsonPharmacyArray {
                    let pharmacyDict = pharmacy as! NSDictionary
                    let newPharmacy = Pharmacy(pharmacyID: pharmacyDict["Id"] as! String,
                                               pharmacyRegionName: pharmacyDict["Name"] as! String)
                    self.pharmacyArray.append(newPharmacy)
                }
                self.delegate?.loadPharmacyList!()
            } catch {
                print("JSON exception")
            }
        }
        dataTask.resume()
        print("Downloading data")
    }
    
    func loadDetail(pharmacyID: String) {
        pharmacyDetailArray.removeAll()
        let networkSession = URLSession.shared
        var request = URLRequest(url: URL(string: "http://test.imobilecode.com/ozyegin/api/eczane/\(pharmacyID)")!)
        
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let dataTask = networkSession.dataTask(with: request) { (data, response, error) in
            print("Data downloaded")
            
            let jsonReadable = NSString(data: data!, encoding: String.Encoding.utf8.rawValue)
            print(jsonReadable!)
            
            do {
                let jsonPharmacy = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers) as! NSArray
                
                for var pharmacy in jsonPharmacy {
                    let pharmacyDict = pharmacy as! NSDictionary
                    let newPharmacy = Pharmacy(pharmacyName: pharmacyDict["Name"] as! String, pharmacyAddress: pharmacyDict["Address"] as! String, pharmacyPhoneNumber: pharmacyDict["PhoneNumber"] as! String)
                    self.pharmacyDetailArray.append(newPharmacy)
                }
                self.delegate?.loadPharmacyDetails!()
            } catch {
                print("JSON exception")
            }
        }
        dataTask.resume()
        print("Downloading data")
    }
}
