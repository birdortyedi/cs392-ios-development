//
//  ViewController.swift
//  Assignment2
//
//  Created by Kinli, Furkan on 11/10/17.
//  Copyright © 2017 user_fknl. All rights reserved.
//

import UIKit


class ViewController: UIViewController {

    @IBOutlet weak var drawButton: UIButton!
    @IBOutlet weak var clearButton: UIButton!
    @IBOutlet weak var resultLabel: UILabel!
    
    var nameArray : [String] = ["Ahmet", "Mehmet", "Osman", "Ayşe", "Fatma", "Ozan", "Hande", "Alperen", "Arda", "Buse"]
    var tmpArray : [String] = []
    var resultArray : [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        clearName()
    }

    func drawName() -> String {
        let nameIndex = arc4random_uniform(UInt32(tmpArray.count))
        let name = tmpArray[Int(nameIndex)]
        tmpArray.removeAtIndex(Int(nameIndex))
        return name
    }

    func clearName() {
        tmpArray.removeAll()
        resultArray.removeAll()
        tmpArray.appendContentsOf(nameArray)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func drawAction(sender: AnyObject) {
        var label : String = ""
        if (resultArray.count < 3) {
            let name = drawName()
            resultArray.append(name)
        }
        
        for x in resultArray {
            let index : String = String(Int(resultArray.indexOf(x)!)+1)
            label += "" + index + "\t" + x + "\n"
        }
        resultLabel.text = label
    }
    
    @IBAction func clearAction(sender: AnyObject) {
        if (resultArray.count == 3) {
            resultLabel.text = ""
            clearName()
        }
    }
}
