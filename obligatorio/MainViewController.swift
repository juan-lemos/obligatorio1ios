import UIKit

class MainViewController: UIViewController , UITableViewDataSource, UITableViewDelegate{

    @IBOutlet weak var table: UITableView!
    
    @IBAction func checkButtonAction(_ sender: UIButton) {
        Item.recipeeList[sender.tag].state = !Item.recipeeList[sender.tag].state
        table.reloadData()
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
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let deleteAction = UITableViewRowAction(style: .default, title: "Delete",
                                                handler: { (action , indexPath) -> Void in
                                                    //TODO: delete from storage
                                                    Item.recipeeList.remove(at : indexPath.row)
                                                    //animate update tableview
                                                    let range = NSMakeRange(0, self.table.numberOfSections)
                                                    let sections = NSIndexSet(indexesIn: range)
                                                    self.table.reloadSections(sections as IndexSet, with: .automatic)
        })
        // Delete button properties
        deleteAction.backgroundColor = UIColor.red
        return [deleteAction]
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
