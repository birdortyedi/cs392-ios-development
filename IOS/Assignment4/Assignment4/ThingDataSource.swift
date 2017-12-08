//
//  ThingDataSource.swift
//  Assignment4
//
//  Created by Furkan Kinli on 28/10/2017.
//  Copyright © 2017 FurkanKinli. All rights reserved.
//

import UIKit

class ThingDataSource: NSObject {
    
    var thingArray : [Thing] = []
    
    override init(){
        
        super.init()
        
        let thing1 = Thing(color :"Red", name:"Apple", type: "Fruit", habitat: "Tree")
        let thing2 = Thing(color :"Brown", name:"Pencil", type: "Pen/Pencil", habitat: "Desk")
        let thing3 = Thing(color :"Orange", name:"Orange", type: "Fruit", habitat: "Tree")
        let thing4 = Thing(color :"Green", name:"Spinach", type: "Vegetable", habitat: "Tree")
        let thing5 = Thing(color :"Black", name:"Car", type: "Vehicle", habitat: "Roads")
        
        thingArray.append(thing1)
        thingArray.append(thing2)
        thingArray.append(thing3)
        thingArray.append(thing4)
        thingArray.append(thing5)
        
    }
}

