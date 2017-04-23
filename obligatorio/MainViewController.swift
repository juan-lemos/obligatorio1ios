//
//  MainViewController.swift
//  obligatorio
//
//  Created by SP 25 on 20/4/17.
//  Copyright © 2017 Apple Inc. All rights reserved.

//DELETE BUTTON ON SWIPE
//http://stackoverflow.com/questions/3309484/uitableviewcell-show-delete-button-on-swipe <--- THIS ONE
//http://stackoverflow.com/questions/8983094/how-to-enable-swipe-to-delete-cell-in-a-tableview
//

//IDENTIFY BUTTON CELL NUMBER
//http://stackoverflow.com/questions/28894765/ios-swift-button-action-in-table-view-cell <---
//the only thing i use was myButton.tag = indexPath.row
//http://stackoverflow.com/questions/35637041/how-does-uibutton-addtarget-self-work


//save data on storage 
//complete tutorial https://developer.apple.com/library/content/referencelibrary/GettingStarted/DevelopiOSAppsSwift/PersistData.html
//simple http://stackoverflow.com/questions/36948323/swift-persistent-storage
//a bit more elaborated http://stackoverflow.com/questions/26233067/simple-persistent-storage-in-swift


import UIKit

class MainViewController: UIViewController , UITableViewDataSource, UITableViewDelegate{

    @IBOutlet weak var table: UITableView!
    
    
    
    
    @IBAction func checkButtonAction(_ sender: UIButton) {
        Item.recipeeList[sender.tag].state = !Item.recipeeList[sender.tag].state
        table.reloadData()
    }
    
    
    
    @IBAction func confirmDelete(_ sender: Any) {
        
        let alert = UIAlertController(title: "Delete list", message: "Are you sure?", preferredStyle: UIAlertControllerStyle.alert)
        
        // add the actions (buttons)
        alert.addAction(UIAlertAction(title: "Yes", style: UIAlertActionStyle.default, handler: { action in
            
            // do something like...
            self.table.alpha = 0
            self.table.isHidden = true
            //TODO: send delete list from storage
            
        }))
        alert.addAction(UIAlertAction(title: "No", style: UIAlertActionStyle.cancel, handler: nil))
        
        // show the alert
        self.present(alert, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Item.recipeeList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellOne = tableView.dequeueReusableCell(withIdentifier: "ItemCell", for: indexPath) as! ItemViewCellTable
        cellOne.name.text = Item.recipeeList[indexPath.row].name
        cellOne.number.text = String(Item.recipeeList[indexPath.row].number)
        cellOne.checkButton.tintColor = giveColorFromBool (Item.recipeeList[indexPath.row].state)
        cellOne.checkButton.tag=indexPath.row
        return cellOne
        
    }
    
    func giveColorFromBool(_ state: Bool)->UIColor{
        if(state){
            return UIColor.init(red: 0.2, green: 0.5, blue: 0.1, alpha: 1.0)
        }else{
            return UIColor.init(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        }
        
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let deleteAction = UITableViewRowAction(style: .default, title: "Delete",
                                                handler: { (action , indexPath) -> Void in
            
            ///button action
        })
        
        // You can set its properties like normal button
        deleteAction.backgroundColor = UIColor.red
        
        return [deleteAction]
    }
    


}
