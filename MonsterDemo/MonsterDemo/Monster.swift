//
//  Monster.swift
//  MonsterDemo
//
//  Created by Student on 1/23/20.
//  Copyright © 2020 Student. All rights reserved.
//

import Foundation

class Monster : CustomStringConvertible, CustomDebugStringConvertible
{
    var description: String
    {
        "Name: \(name), Num of Heads: \(numHeads), Weapons: \(weapons)"
    }
    var debugDescription: String
    {
        "Name: \(name), Num of Heads: \(numHeads), Weapons: \(weapons)"
    }
    
    // Use var instead of let to make immutable
    private var numHeads: Int = 1
    private var name: String = ""
    private var weapons: [String] = []
    private var undead: Bool
    
    init (numHeads: Int, name: String, weapons: [String], undead: Bool)
    {
        // Have to initialize undead first so all intial values are set b4 method calls
        self.undead = undead
        self.setNumHeads(numHeads)
        self.set(name: name)
        self.set(weapons: weapons)
    }
    convenience init()
    {
        self.init(numHeads: 1, name: "Orc", weapons: [], undead: false)
    }
    
    func getNumHeads() -> Int
    {
        numHeads
    }
    func setNumHeads(_ _numHeads: Int)
    {
        if _numHeads < 0 || _numHeads > 1000
        {
            numHeads = 500
        }
        else
        {
            numHeads = _numHeads
        }
    }
    
    func getName() -> String
    {
        name
    }
    func set(name: String)
    {
        self.name = name
    }
    
    func getWeapons() -> [String]
    {
        weapons
    }
    func set(weapons: [String])
    {
        self.weapons = weapons
    }
    
    func fearsomeRoar()
    {
        print("Roar!")
    }
    
} // End Class
