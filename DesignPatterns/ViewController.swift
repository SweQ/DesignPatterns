//
//  ViewController.swift
//  DesignPatterns
//
//  Created by alexKoro on 15.03.23.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        workWithSimpleFactory()
    }

}

extension ViewController {
    func workWithSimpleFactory() {
        let ship = DeliveryTransportFactory.shared.create(for: .water)
        let truck = DeliveryTransportFactory.shared.create(for: .ground)
        let airplane = DeliveryTransportFactory.shared.create(for: .air)
        
        let deliverTransports = [ship, truck, airplane]
        
        for transport in deliverTransports {
            transport.toDeliver()
        }
    }
}

