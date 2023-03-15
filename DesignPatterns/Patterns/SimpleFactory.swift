//
//  SimpleFactory.swift
//  DesignPatterns
//
//  Created by alexKoro on 15.03.23.
//

import Foundation

enum DeliveryWay: String {
    case air
    case ground
    case water
}

protocol DeliveryTransport {
    var name: String { get set }
    var deliveryWay: DeliveryWay { get set }
    
    func toDeliver()
}

class Truck: DeliveryTransport {
    var name = "MAN"
    var deliveryWay = DeliveryWay.ground
    
    func toDeliver() {
        print("\(name) delivers by \(deliveryWay.rawValue).")
    }
}

class Airplane: DeliveryTransport {
    var name = "Boeing"
    var deliveryWay = DeliveryWay.air
    
    func toDeliver() {
        print("\(name) delivers by \(deliveryWay.rawValue).")
    }
}

class Ship: DeliveryTransport {
    var name = "MSC New York"
    var deliveryWay = DeliveryWay.water
    
    func toDeliver() {
        print("\(name) delivers by \(deliveryWay.rawValue).")
    }
}

class DeliveryTransportFactory {
    static let shared = DeliveryTransportFactory()
    
    private init() { }
    
    func create(for way: DeliveryWay) -> DeliveryTransport {
        switch way {
        case .air:
            return Airplane()
        case .ground:
            return Truck()
        case .water:
            return Ship()
        }
    }
}
