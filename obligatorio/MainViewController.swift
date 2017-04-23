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
            
            // do something like...
            self.table.alpha = 0
            self.table.isHidden = true
            //TODO: send delete list from storage
            
        }))
        alert.addAction(UIAlertAction(title: "No", style: UIAlertActionStyle.cancel, handler: nil))
        
        // show the alert
        self.present(alert, animated: true, completion: nil)
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellOne = tableView.dequeueReusableCell(withIdentifier: "ItemCell", for: indexPath) as! ItemViewCellTable
        cellOne.name.text = Item.recipeeList[indexPath.row].name
        cellOne.number.text = String(Item.recipeeList[indexPath.row].number)
        return cellOne
        
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
