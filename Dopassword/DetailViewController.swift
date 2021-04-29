//
//  DetailViewController.swift
//  Dopassword
//
//  Created by user190009 on 4/21/21.
//

import UIKit
import Parse
import AlamofireImage

class DetailViewController: UIViewController {

    var account: PFObject!
    
    @IBOutlet weak var appNameUpdate: UITextField!
    
    @IBOutlet weak var passwordUpdate: UITextField!
    
    
    @IBOutlet weak var imageView: UIImageView!
    
    
    @IBOutlet weak var appName: UILabel!
    
    
    @IBOutlet weak var userName: UILabel!
    
    
    @IBOutlet weak var password: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        appName.text = account["account"] as? String
        userName.text = account["name"] as? String
        password.text = account["password"] as? String
        let imageFile = account["image"] as! PFFileObject
        let urlString = imageFile.url!
        let url = URL(string: urlString)!
        
        imageView.af.setImage(withURL: url)
        // Do any additional setup after loading the view.
    }
        
    let accountInfo = PFObject(className: "Accounts")
    

    ///NOT DELETING FROM PARSE
    @IBAction func onDeleteButton(_ sender: Any) {
    //    PFObject.deleteAll(inBackground: [accountInfo], block: nil)
        print("Good")
        
       
        let query = PFQuery(className:"Accounts")
//Error: Type of Expression is ambigusous without more context.
        
        
        query.getObjectInBackground(withId: account.objectId!) { (parseObject, error) in
            if error != nil {
                print(error!.localizedDescription)
            } else if parseObject != nil {
                parseObject!.deleteInBackground()
                self.navigationController?.popViewController(animated: true)
                // delete later self.performSegue(withIdentifier: "backSegue", sender: nil)
                // eli put this one in self.dismiss(animated: true, completion: nil)
            }
        }
    }
    
    @IBAction func onSaveButton(_ sender: Any) {
        
//        var query = PFQuery(className:"Accounts")
//
//        query.getObjectInBackgroundWithId("<PARSE_OBJECT_ID>") {
//          (parseObject: PFObject?, error: NSError?) -> Void in
//          if error != nil {
//            print(error)
//          } else if parseObject != nil {
//            parseObject["password"] = passwordUpdate.text!
//            parseObject["image"] = PFFile(name:"resume.txt", data:"My string content".dataUsingEncoding(NSUTF8StringEncoding))
//            parseObject["name"] = "A string"
//            parseObject["account"] = appNameUpdate.text!
//
//            parseObject.saveInBackground()
//          }
//        }
//
//
//        print("Error")
//        account["password"] = passwordUpdate.text!
//        account["account"] = appNameUpdate.text!
//
//        accountInfo.saveInBackground{ (success, error) in
//            if success {
//                self.dismiss(animated: true, completion: nil)
//                print("saved!")
//            } else {
//                print("Error!")
//            }
//
  }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

//}
}
