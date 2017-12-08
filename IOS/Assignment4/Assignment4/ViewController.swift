//
//  ViewController.swift
//  Assignment4
//
//  Created by Furkan Kinli on 28/10/2017.
//  Copyright © 2017 FurkanKinli. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let dataSource = ThingDataSource()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier?.contains("q"))!{
        let detailController = segue.destination as! ThingDetailViewController
        let pressedButton = sender as! UIButton
        let selectedThing = dataSource.thingArray[pressedButton.tag]
        detailController.selectedThing = selectedThing
        }
    }
}

