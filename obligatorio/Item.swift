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
    var state: Bool
    
    init(name : String, number : Int64, state : Bool){
        self.name = name
        self.number = number
        self.state = state
    }
    
    static var recipeeList : [Item] = [Item(name:"Hamburguesa",number:2, state:true),
                                       Item(name:"Hamburguesa",number:2,state : false),
                                       Item(name:"Hamburguesa",number:2,state : false),
                                       Item(name:"Hamburguesa",number:2,state : false),
                                       Item(name:"Hamburguesa",number:2,state : false),
                                       Item(name:"Hamburguesa",number:2,state : false),
                                       Item(name:"Hamburguesa",number:2,state : false),
                                       Item(name:"Hamburguesa",number:2,state : false),
                                       Item(name:"Hamburguesa",number:2,state : false),
                                       Item(name:"Hamburguesa",number:2,state : false),
                                       Item(name:"Hamburguesa",number:2,state : false),
                                       Item(name:"Hamburguesa",number:2,state : false),
                                       Item(name:"Hamburguesa",number:2,state : false),
                                       Item(name:"Hamburguesa",number:2,state : false),
                                       Item(name:"Hamburguesa",number:2,state : false),
                                       Item(name:"Hamburguesa",number:2,state : false),
                                       Item(name:"Hamburguesa",number:2,state : false),
                                       Item(name:"Hamburguesa",number:2,state : false),
                                       Item(name:"Hamburguesa",number:2,state : false),
                                       Item(name:"Hamburguesa",number:2,state : false),
                                       Item(name:"Hamburguesa",number:2,state : false),
                                       Item(name:"Hamburguesa",number:2,state : false),
                                       Item(name:"Hamburguesa",number:2,state : false),
                                       Item(name:"Hamburguesa",number:2,state : false)]
    
    
}
