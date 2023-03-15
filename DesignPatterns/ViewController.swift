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

    }

}

//MARK: -SimpleFactory

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

//MARK: -AbstractFactory

extension ViewController {
    func workWithAbstractFactory() {
        
        var raceOfHero: Race?
        var heroFactory: HeroAbstractFactory?
        var warrior: Warrior?
        var wizard: Wizard?
        
        raceOfHero = .elf
        
        switch raceOfHero {
        case .elf:
            heroFactory = ElfHeroFactory.shared
        case .human:
            heroFactory = HumanHeroFactory.shared
        default:
            print("Error")
        }
        
        warrior = heroFactory?.createWarrior()
        wizard = heroFactory?.createWizard()
        
        warrior?.physicalAttack()
        wizard?.magicAttack()
    }
}

