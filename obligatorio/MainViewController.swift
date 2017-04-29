//
//  MainViewController.swift
//  obligatorio
//
//  Created by SP 25 on 20/4/17.
//  Copyright © 2017 Apple Inc. All rights reserved.
//

import UIKit

class MainViewController: UIViewController , UITableViewDataSource, UITableViewDelegate{

    @IBOutlet weak var table: UITableView!
    
    @IBAction func checkButtonAction(_ sender: UIButton) {
        let newState = !ModelManager.shared.itemsList[sender.tag].state
        let row = sender.tag
        ModelManager.shared.updateItemState(newState: newState, atIndex: row)
        animateUpdateTable()
        initPage()
    }
    
    var rowToEdit: Int?
    
    // This function is called before the segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        // get a reference to the second view controller
        let addItemViewController = segue.destination as! AddItemViewController
        
        // set a variable in the second view controller with the String to pass
        
        if rowToEdit != nil{
            
            addItemViewController.productNameEdit = ModelManager.shared.itemsList[rowToEdit!].name
            addItemViewController.productQuantityEdit = String(ModelManager.shared.itemsList[rowToEdit!].number)
            addItemViewController.selectedItemRow = rowToEdit
            rowToEdit = nil
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        initPage()
        animateUpdateTable()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()


        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func confirmDelete(_ sender: Any) {
        
        let alert = UIAlertController(title: "Delete list", message: "Are you sure?", preferredStyle: UIAlertControllerStyle.alert)
        
        // add the actions (buttons)
        alert.addAction(UIAlertAction(title: "Yes", style: UIAlertActionStyle.default, handler: { action in
            ModelManager.shared.itemsList.removeAll()
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
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellOne = tableView.dequeueReusableCell(withIdentifier: "ItemCell", for: indexPath) as! ItemViewCellTable
        cellOne.name.text = ModelManager.shared.itemsList[indexPath.row].name
        cellOne.number.text = String(ModelManager.shared.itemsList[indexPath.row].number)
        cellOne.checkButton.tintColor = giveColorFromBool (ModelManager.shared.itemsList[indexPath.row].state)
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
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let deleteAction = UITableViewRowAction(style: .default, title: "Delete",
                                                handler: { (action , indexPath) -> Void in
                                                    
                                                    ModelManager.shared.itemsList.remove(at : indexPath.row)
                                                    self.animateUpdateTable()
                                                    self.initPage()
        })
        
        
        // You can set its properties like normal button
        deleteAction.backgroundColor = UIColor.red
        
        
        
        let editAction = UITableViewRowAction(style: .default, title: "Edit", handler: {(action, indexPath) -> Void in
            self.rowToEdit = indexPath.row
            self.performSegue(withIdentifier: "marketToAdd", sender: self)
        })
        
        editAction.backgroundColor = UIColor.green
        
        return [deleteAction,editAction]
    }
    
    func animateUpdateTable(){
        let range = NSMakeRange(0, self.table.numberOfSections)
        let sections = NSIndexSet(indexesIn: range)
        self.table.reloadSections(sections as IndexSet, with: .automatic)
        
    }
    
    func initPage(){
        if (ModelManager.shared.itemsList.count == 0){
            self.table.alpha = 0
            self.table.isHidden = true
        }else{
            self.table.alpha = 1
            self.table.isHidden = false
        }
    }
      /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
