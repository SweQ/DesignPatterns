//
//  AbstractFactory.swift
//  DesignPatterns
//
//  Created by alexKoro on 15.03.23.
//

import Foundation

enum Race {
    case elf
    case human
}

protocol Warrior {
    var race: Race { get }
    var nickname: String { get set }
    var pAttackLvl: Int { get set }
    
    func physicalAttack()
}

protocol Wizard {
    var race: Race { get }
    var nickname: String { get set }
    var mAttackLvl: Int { get set }
    var mSpeed: Int { get set }
    
    func magicAttack()
}

class HumanWarrior: Warrior {
    var race = Race.human
    var nickname = "HumanWarrior123"
    var pAttackLvl = 10
    
    func physicalAttack() {
        print("Human physical attack.")
    }
}

class ElfWarrior: Warrior {
    var race = Race.elf
    var nickname = "ElfWarrior123"
    var pAttackLvl = 8
    
    private func flashAttack() {
        print("Elf flash attack.")
    }
    
    func physicalAttack() {
        flashAttack()
        print("Elf physical attack.")
    }
}

class HumanWizard: Wizard {
    var race = Race.human
    var nickname = "HumanWizard123"
    var mAttackLvl = 14
    var mSpeed = 5
    
    func magicAttack() {
        print("Human magic attack.")
    }
}

class ElfWizard: Wizard {
    var race = Race.elf
    var nickname = "ElfWizard123"
    var mAttackLvl = 12
    var mSpeed = 8
    
    private func lightsMagicAttack() {
        print("Elf lights magic attack.")
    }
    
    func magicAttack() {
        print("Elf magic attack.")
        lightsMagicAttack()
    }
}

protocol HeroAbstractFactory {
    func createWarrior() -> Warrior
    func createWizard() -> Wizard
}

class HumanHeroFactory: HeroAbstractFactory {
    
    static let shared = HumanHeroFactory()
    
    private init() { }
    
    func createWarrior() -> Warrior {
        return HumanWarrior()
    }
    
    func createWizard() -> Wizard {
        return HumanWizard()
    }
}

class ElfHeroFactory: HeroAbstractFactory {
    
    static let shared = ElfHeroFactory()
    
    private init() { }
    
    func createWarrior() -> Warrior {
        return ElfWarrior()
    }
    
    func createWizard() -> Wizard {
        return ElfWizard()
    }
    
    
}
