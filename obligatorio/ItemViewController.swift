import UIKit
//pages



class ItemViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var chooseButton: UIButton!
    
    var imagePicker = UIImagePickerController()
    
    @IBAction func btnClicked(_ sender: Any) {
    
        if UIImagePickerController.isSourceTypeAvailable(.savedPhotosAlbum){
            print("Button capture")
            imagePicker.delegate = self
            imagePicker.sourceType = .savedPhotosAlbum;
            imagePicker.allowsEditing = false
            
            self.present(imagePicker, animated: true, completion: nil)
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        imageView.image = info[UIImagePickerControllerOriginalImage] as? UIImage
        imageView.contentMode = .scaleAspectFit
        dismiss(animated: true, completion: nil)
    }
    
//    func imagePickerController(picker: UIImagePickerController!, didFinishPickingImage image: UIImage!, editingInfo: NSDictionary!){
//        self.dismiss(animated: true, completion: { () -> Void in
//            
//        })
//        
//        imageView.image = image
//    }
}
