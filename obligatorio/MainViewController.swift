//
//  MainViewController.swift
//  obligatorio
//
//  Created by SP 25 on 20/4/17.
//  Copyright © 2017 Apple Inc. All rights reserved.
//
//change app name
//http://stackoverflow.com/a/34752653


import UIKit

class MainViewController: UIViewController , UITableViewDataSource, UITableViewDelegate{
    
    @IBOutlet weak var table: UITableView! // tableview list of items
    
    @IBOutlet weak var textsView: UIView! //add message
    
    
    //change item state
    @IBAction func checkButtonAction(_ sender: UIButton) {
        let newState = !ModelManager.shared.itemsList[sender.tag].state
        let row = sender.tag
        ModelManager.shared.updateItemState(newState: newState, atIndex: row)
        initPage()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        //when came to this view from other
            initPage()
    }
    
    override func viewDidLoad() { //ONLY ONE TIME -- executed only the first time the view is load
        //necessary for change the alpha values according with table content on disk
        super.viewDidLoad()
        
        if (ModelManager.shared.itemsList.count == 0){
            self.table.alpha = 0
            self.textsView.alpha=1
            self.table.isHidden = true
            self.textsView.isHidden = false
        }else {
            self.table.alpha = 1
            self.textsView.alpha=0
            self.table.isHidden = false
            self.textsView.isHidden = true
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func confirmDelete(_ sender: Any) { //delete all items message pop up
        let alert = UIAlertController(title: "Delete list", message: "Are you sure?", preferredStyle: UIAlertControllerStyle.alert)
        // add the actions (buttons)
        alert.addAction(UIAlertAction(title: "Yes", style: UIAlertActionStyle.default, handler: { action in
            ModelManager.shared.deleteAllItems()
            self.initPage()
        }))
        alert.addAction(UIAlertAction(title: "No", style: UIAlertActionStyle.cancel, handler: nil))
        // show the alert
        self.present(alert, animated: true, completion: nil)
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ModelManager.shared.itemsList.count
    }
    
    //load item into cells
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellOne = tableView.dequeueReusableCell(withIdentifier: "ItemCell", for: indexPath) as! ItemViewCellTable
        cellOne.name.text = ModelManager.shared.itemsList[indexPath.row].name
        cellOne.number.text = String(ModelManager.shared.itemsList[indexPath.row].number)
        cellOne.checkButton.tintColor = giveColorFromBool (ModelManager.shared.itemsList[indexPath.row].state)
        cellOne.checkButton.tag=indexPath.row
        return cellOne
        
    }
    
    
    func giveColorFromBool(_ state: Bool)->UIColor{ //positive and negative color
        if(state){
            return UIColor.init(red: 0.69, green: 0.22, blue: 0, alpha: 1.0)
        }else{
            return UIColor.init(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        }
        
    }
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        //DELETE BUTTON
        let deleteAction = UITableViewRowAction(style: .default, title: "Delete",
                                                handler: { (action , indexPath) -> Void in
                                                    
                                                    ModelManager.shared.itemsList.remove(at : indexPath.row)
                                                    self.animateUpdateTable()
                                                    self.initPage()
        })
        deleteAction.backgroundColor = UIColor.red
        
        //EDIT BUTTON
        let editAction = UITableViewRowAction(style: .default, title: "Edit", handler: {(action, indexPath) -> Void in
            self.performSegue(withIdentifier: "marketToAdd", sender: indexPath.row) //call prepare method
        })
        editAction.backgroundColor = UIColor.green
        //the order is important
        return [editAction,deleteAction]
    }
    
    func animateUpdateTable(){ //animate row change or delete
        let range = NSMakeRange(0, self.table.numberOfSections)
        let sections = NSIndexSet(indexesIn: range)
        self.table.reloadSections(sections as IndexSet, with: .automatic)
    
    }
    
    func initPage(){ //animate when there is no element/// when add element in empty list // and when item change or deleted
        animateUpdateTable()
        if (ModelManager.shared.itemsList.count == 0){//if list empty
            UIView.animateKeyframes(withDuration: 1.0, delay: 0.0, options: [], animations: {
                UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: 1, animations: {
                    self.table.alpha = 0
                    self.textsView.alpha=1
                })
            }, completion: {com in
                self.table.isHidden = true
                self.textsView.isHidden = false
            })
        }else{//have elements
            if (self.table.alpha==0){//if first element in list
                UIView.animateKeyframes(withDuration: 0.8, delay: 0.0, options: [], animations: {
                    UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: 1, animations: {
                        self.table.alpha = 1
                        self.textsView.alpha=0
                    })
                }, completion: {com in
                    self.table.isHidden = false
                    self.textsView.isHidden = true
                })
                
            }
        }
        
    }
    
    
    
    
    //when press edit
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let addView = segue.destination as! AddItemViewController
        if let num = sender as? Int {
            addView.elementNumber = num
        }
    }
    
    
}
