//
//  ModelManager.swift
//  obligatorio
//
//  Created by SP 25 on 26/4/17.
//  Copyright © 2017 Apple Inc. All rights reserved.
//

import UIKit


class ModelManager  {
    
    var itemsList = [Item]()
    
    static let shared = ModelManager()
    
    init() {
        itemsList = getItems()
    }
    
    func save() {
        saveItems(items: itemsList)
        
    }
    
    
    func addItem(item: Item) {
        itemsList.append(item)
    }
    
    func updateItem(item: Item, atIndex: Int){
        itemsList[atIndex] = item
    }
    
    func updateItemState(newState: Bool, atIndex: Int){
        itemsList[atIndex].state = newState
    }
    
    func deleteAllItems(){
        itemsList.removeAll()
    }
    
    private  func saveItems( items:[Item]){
        var itemDics : [[String:String]] = [[String:String]]()
        for item in items{
            itemDics.append(Item.toDictionary(item))
        }
        saveItemsDic(itemDics)
    }
    
    private  func getItems( )-> [Item]{
        let dics = getItemsDic()
        var itemList : [Item] = [Item]()
        for dic in dics{
            itemList.append(Item.toItem(dic))
        }
        return itemList
    }
    
    private func saveItemsDic (_ itemsList :  [[String : String]] ) {
        UserDefaults.standard.setValue(itemsList, forKey: "0")
    }
    private func getItemsDic () ->[[String : String]] {
        if let itemDics = UserDefaults.standard.object(forKey: "0") as? [[String : String]] {
            return itemDics
        }
        else{
            return [[String:String]]()
        }
    }
}
