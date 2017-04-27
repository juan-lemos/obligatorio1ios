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
    var oldAlpha : Int = min (1,ModelManager.shared.itemsList.count)
    
    
    @IBAction func checkButtonAction(_ sender: UIButton) {
        ModelManager.shared.itemsList[sender.tag].state = !ModelManager.shared.itemsList[sender.tag].state
        initPage()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        initPage()
        
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
                                                    self.initPage()
                                                    
                                                    
        })
        
        // You can set its properties like normal button
        deleteAction.backgroundColor = UIColor.red
        
        return [deleteAction]
    }
    
    func animateUpdateTable(){
        let range = NSMakeRange(0, self.table.numberOfSections)
        let sections = NSIndexSet(indexesIn: range)
        self.table.reloadSections(sections as IndexSet, with: .automatic)
        
    }
    
    
    @IBOutlet weak var textsView: UIView!
    
    func initPage(){
        if (ModelManager.shared.itemsList.count == 0){
            UIView.animateKeyframes(withDuration: 3.0, delay: 0.0, options: [], animations: {
                UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: 1, animations: {
                    self.table.alpha = 0
                    self.textsView.alpha=1
                })
                
            }, completion: {com in
                //codigo que quiero hacer cuando termine
            })
            self.table.isHidden = true
            self.oldAlpha=0
        }else{
            if (oldAlpha==0){
                UIView.animateKeyframes(withDuration: 3.0, delay: 0.0, options: [], animations: {
                    UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: 1, animations: {
                        self.table.alpha = 1
                        self.textsView.alpha=0
                    })
                    
                }, completion: {com in
                    //codigo que quiero hacer cuando termine
                })
                self.table.isHidden = false
                self.oldAlpha=1
            }
        }
        animateUpdateTable()
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
