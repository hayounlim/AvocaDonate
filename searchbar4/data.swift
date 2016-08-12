//
//  data.swift
//  searchbar4
//
//  Created by GEGWC8 on 8/3/16.
//  Copyright © 2016 GEGWC8. All rights reserved.
//

import Foundation

class Candy {
    let name:String
    let address:String
    let food:Array<String>
    let picture:String
    let email:String
    let phonenum:String
    let website:String
    
    init (address:String, name:String, food:Array<String>, picture:String, email:String, phonenum:String, website:String) {
        self.address = address
        self.name = name
        self.food = food
        self.picture = picture
        self.email = email
        self.phonenum = phonenum
        self.website = website
    }
}

//func weaponImage() -> UIImage? {
//    switch self.weapon {
//    case .Blowgun:
//        return UIImage(named: "blowgun.png")
//    case .Fire:
//        return UIImage(named: "fire.png")
//    case .NinjaStar:
//        return UIImage(named: "ninjastar.png")
//    case .Smoke:
//        return UIImage(named: "smoke.png")
//    case .Sword:
//        return UIImage(named: "sword.png")
//    }
//}