//
//  Aviatrix.swift
//  AviatrixApp
//
//  Created by Amy Holt on 6/10/18.
//  Copyright © 2018 Amy Holt. All rights reserved.
//

import Foundation

class Aviatrix {
    
    var author : String
    init(authorName : String) {
      author = authorName
    }
    
    var running = false
    func start() -> Bool {
      running = true
      return running
    }

    var location = "St. Louis"

    var distanceTraveled = 0.0

    var fuelLevel = 5000.0
    var maxFuel = 5000.0
    var milesPerGallon = 0.4
    var fuelCost = 0.0
    
    func refuel() -> Double {
        let info = AviatrixData()
        let refueled = maxFuel - fuelLevel
        let fuelPrice = info.fuelPrices[location]!
        let payment = refueled * fuelPrice
        fuelCost += payment
        fuelLevel = 5000.0
        return refueled
    }

    func flyTo(destination : String) {
        let info = AviatrixData()
        distanceTraveled += Double(info.knownDistances[location]![destination]!)

        location = destination

        let usedFuel = Double(distanceTraveled) * milesPerGallon
        fuelLevel -= usedFuel
    }
    
    func distanceTo(start: String, target : String) -> Int {
       let distance = AviatrixData()
       return distance.knownDistances[start]![target]!
    }
    
    func knownDestinations() -> [String] {
       let destinations = AviatrixData()
       return Array(destinations.knownDistances.keys)
    }
}
