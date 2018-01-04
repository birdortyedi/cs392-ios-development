//
//  PharmacyDetailViewController.swift
//  Homework-6 for CS392 IOS Development Course @ Ozyegin University
//
//  Created by Furkan Kınlı on 03/12/17.
//  Copyright © 2017 Furkan Kınlı. All rights reserved.
//

import UIKit

class PharmacyDetailViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, PharmacyDataDelegate {
    
    var selectedPharmacy : Pharmacy?
    let pharmacyDataSource = PharmacyDataSource()
    
    @IBOutlet weak var pharmacyDetailTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        self.title = "\(selectedPharmacy!.pharmacyName)"
        pharmacyDataSource.delegate = self
    }
    
    override func viewDidAppear(_ animated: Bool) {
        pharmacyDataSource.loadDetail(pharmacyID: selectedPharmacy!.pharmacyID)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pharmacyDataSource.pharmacyDetailArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "pharmacyDetailTableViewCell", for: indexPath) as! PharmacyDetailTableViewCell
        
        let pharmacy = pharmacyDataSource.pharmacyDetailArray[indexPath.row]
        
        cell.pharmacyName.text = "\(pharmacy.pharmacyName)"
        cell.pharmacyPhoneNumber.text = "\(pharmacy.pharmacyPhoneNumber)"
        cell.pharmacyAddress.text = "\(pharmacy.pharmacyAddress)"
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Pharmacy List for \(selectedPharmacy!.pharmacyRegionName)"
    }
    
    func loadPharmacyDetails() {
        DispatchQueue.main.async {
            self.pharmacyDetailTableView.reloadData()
        }
    }
}
