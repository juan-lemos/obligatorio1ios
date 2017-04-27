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
    
    public static func toDictionary(_ item:Item)-> [String : String] {
        var dic = [String : String]()
        
        dic ["name"] = item.name
        dic ["number"] = String(item.number)
        if (item.state){
            dic ["state"] = "True"
        }
        else {
            dic ["state"] = "False"
        }
    return dic
    }
    
    public static func toItem(_ dic:[String : String])->Item{
        
        let name = dic["name"]
        let number = dic["number"]
        let state:Bool
        if(dic["state"] == "True"){
            state = true
        }else{
            state = false
        }
        return Item(name: name!,number: Int64(number!)!,state: state)
    }
 
}
