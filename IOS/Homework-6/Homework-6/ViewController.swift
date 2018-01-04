//
//  ViewController.swift
//  Homework-6 for CS392 IOS Development Course @ Ozyegin University
//
//  Created by Furkan Kınlı on 03/12/17.
//  Copyright © 2017 Furkan Kınlı. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate, UITableViewDataSource, PharmacyDataDelegate {

    @IBOutlet weak var pharmacyTableView: UITableView!
    
    let pharmacyDataSource = PharmacyDataSource()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        self.title = "Pharmacy App"
        pharmacyDataSource.delegate = self
    }
    
    override func viewDidAppear(_ animated: Bool) {
        pharmacyDataSource.loadList()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func loadPharmacyList() {
        DispatchQueue.main.async {
            self.pharmacyTableView.reloadData()
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pharmacyDataSource.pharmacyArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "pharmacyTableViewCell", for: indexPath) as! PharmacyTableViewCell
        
        let pharmacy = pharmacyDataSource.pharmacyArray[indexPath.row]
        
        cell.pharmacyName.text = "\(pharmacy.pharmacyRegionName)"
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Region List"
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        let selectedCell = sender as! PharmacyTableViewCell
        let indexPath = self.pharmacyTableView.indexPath(for: selectedCell)
        let controller = segue.destination as! PharmacyDetailViewController

        controller.selectedPharmacy = pharmacyDataSource.pharmacyArray[indexPath!.row]
    }
}

