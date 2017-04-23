//
//  Recipee.swift
//  protocolos
//
//  Created by Paula Estrade on 4/18/17.
//  Copyright © 2017 Apple Inc. All rights reserved.
//

import UIKit

class Item {
    var name : String
    var number : Int64
    
    init(name : String, number : Int64){
        self.name = name
        self.number = number
    }
    
    static var recipeeList : [Item] = [Item(name:"Hamburguesa",number:2), Item(name:"Hamburguesa",number:2)]
    
    
}
