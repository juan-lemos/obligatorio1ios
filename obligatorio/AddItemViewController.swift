
//
//  AddItemViewController.swift
//  obligatorio
//
//  Created by SP 25 on 26/4/17.
//  Copyright © 2017 Apple Inc. All rights reserved.
//

import UIKit

class AddItemViewController: UIViewController {

    @IBOutlet weak var productName: UITextField!
    @IBOutlet weak var productQuantity: UITextField!
    
    var productNameEdit: String?
    var productQuantityEdit: String?
    var selectedItemRow: Int?
    var editingItem: Bool?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if productNameEdit != nil && productQuantityEdit != nil {
            //estoy editando
            editingItem = true
            productName.text = productNameEdit
            productQuantity.text = productQuantityEdit
        }else{
            editingItem = false
            //estoy agregando
        }
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func doneButtonAction(_ sender: Any) {
        
        if let quantity = Int(productQuantity.text ?? "") {
            let quantityInt64 = Int64(quantity)
            let item = Item(name : productName.text!, number : quantityInt64, state : false)
            if editingItem! {
                //update
                ModelManager.shared.updateItem(item: item, atIndex: selectedItemRow!)
            }else{
                ModelManager.shared.addItem(item: item)
            }
            
            self.navigationController?.popViewController(animated: true)
            
        }else{
            let alert = UIAlertController(title: "Error", message: "Only numbers allow.", preferredStyle: UIAlertControllerStyle.alert)
            
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.cancel, handler: nil))
            
            // show the alert
            self.present(alert, animated: true, completion: nil)
        
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
