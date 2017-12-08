//
//  ThingDetailViewController.swift
//  Assignment4
//
//  Created by Furkan Kinli on 28/10/2017.
//  Copyright © 2017 FurkanKinli. All rights reserved.
//

import UIKit

class ThingDetailViewController: UIViewController {
   
    var selectedThing : Thing? = nil
    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var label2: UILabel!
    @IBOutlet weak var label3: UILabel!  
    
    override func viewDidLoad() {
        super.viewDidLoad()
        label1.text = selectedThing!.thingColor
        label2.text = selectedThing!.thingType
        label3.text = selectedThing!.thingHabitat
        self.navigationItem.title = selectedThing!.thingName
    

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
