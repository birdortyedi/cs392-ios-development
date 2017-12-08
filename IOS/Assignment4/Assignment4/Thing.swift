//
//  Thing.swift
//  Assignment4
//
//  Created by Furkan Kinli on 28/10/2017.
//  Copyright © 2017 FurkanKinli. All rights reserved.
//

import UIKit

class Thing: NSObject {
    
    let thingName : String
    let thingColor : String
    let thingType : String
    let thingHabitat : String
    
    init(color :String, name: String, type: String, habitat: String){
        thingName = name
        thingColor = color
        thingType = type
        thingHabitat = habitat
    }
}

