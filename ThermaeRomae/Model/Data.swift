//
//  Data.swift
//  ThermaeRomae
//
//  Created by 陳姿穎 on 2019/11/19.
//  Copyright © 2019 陳姿穎. All rights reserved.
//

import Foundation

struct WannaData: Codable {
    
    var poolName: String
    var peopleAmount: Int
    var upperLimit: Int
    var introduction: String
    
}

struct LuHseinData: Codable {
    
    var pmany: Int
    
}

struct WannaLuHseinData: Codable {
    
    var name: String
    var quantity: Int
    var limit: Int
    var introduction: String
    
}

struct Customer: Codable {
    
    var name: String

}

struct LuHseinBeverage: Codable {
    
    var data: [Data]
    
    struct Data: Codable {
        var id: Int
        var name: String
    }
    
    
}
