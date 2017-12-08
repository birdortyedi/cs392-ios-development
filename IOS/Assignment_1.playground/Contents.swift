//: Playground - noun: a place where people can play
//: Furkan Kınlı - S002969 
//: Assignment-1: Introduction to Swift

import UIKit

class Room {
    var number : Int
    var width : Double
    var height : Double
    
    init(number: Int, width: Double, height: Double) {
        self.number = number
        self.width = width
        self.height = height
    }
    
    func printDescription() {
        
    }
}

class StudyRoom : Room {
    var maxOccupancy : Int

    init(number: Int, width: Double, height: Double, maxOccupancy: Int) {
        self.maxOccupancy = maxOccupancy
        super.init(number: number, width: width, height: height)
    }
    
    func calculateArea() -> Double {
        return width * height
    }
    
    override func printDescription() {
        print("This is a study room!")
        print("Number of room:  \(number)")
        print("Width: \(width) meters")
        print("Height \(height) meters")
        print("Area of room: \(self.calculateArea()) square meters")
        print("Maximum number of people allowed: \(maxOccupancy)")
    }
}

class Classroom : Room {
    var equipment : [String : Double]
    
    init(number: Int, width: Double, height: Double, equipment: [String : Double]) {
        self.equipment = equipment
        super.init(number: number, width: width, height: height)
    }
    
    func calculateArea() -> Double {
        return width * height
    }
    
    func calculateCost() -> Double {
        var sum : Double = 0
        for x in equipment {
            sum += x.1
        }
        return sum
    }
    
    override func printDescription() {
        print("This is a classroom!")
        print("Number of room:  \(number)")
        print("Width: \(width) meters")
        print("Height \(height) meters")
        print("Area of room: \(self.calculateArea()) square meters")
        print("Number of equipments in the classroom: \(equipment.count)")
        for x in equipment {
            print("\(x.0) costs \(x.1) TL")
        }
        print("Total cost for all equipment: \(self.calculateCost()) TL")
    }
}

var studyRoom = StudyRoom(number: 1, width: 100.0, height: 250.0, maxOccupancy: 5)
var classroom = Classroom(number: 1, width: 320.0, height: 450.0, equipment: ["Board" : 1799.0, "Projector" : 899.0, "Desks" : 459.0, "Computer" : 2299.0, "Boardmarkers" : 39.9])

studyRoom.printDescription()
classroom.printDescription()
