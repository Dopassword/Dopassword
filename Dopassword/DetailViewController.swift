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
    
    @IBAction func onRandom(_ sender: Any) {
        
        passwordUpdate.text = randomString(length: 8)
        
    }
    
    func randomString(length : Int) -> String {
        let charSet = Array("ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890!@#$%^&*")
        var random = ""
        for _ in 1...length {
            random.append(charSet.randomElement()!)
        }
        return random
    }


    @IBAction func onDeleteButton(_ sender: Any) {

        let query = PFQuery(className:"Accounts")
    
        query.getObjectInBackground(withId: account.objectId!) { (parseObject, error) in
            if error != nil {
                print(error!.localizedDescription)
            } else if parseObject != nil {
                parseObject!.deleteInBackground()
                self.navigationController?.popViewController(animated: true)
            }
        }
    }
    
    @IBAction func onSaveButton(_ sender: Any) {
        
    let query = PFQuery(className:"Accounts")

        query.getObjectInBackground(withId: account.objectId!) { (parseObject, error) in
            if error != nil {
                print(error!.localizedDescription)
            } else if parseObject != nil {
                parseObject?["password"] = self.passwordUpdate.text!
                //parseObject?["image"] = PFFile(name:"resume.txt", data:"My string content".dataUsingEncoding(NSUTF8StringEncoding))
                parseObject?["account"] = self.appNameUpdate.text!
                parseObject!.saveInBackground()
                self.navigationController?.popViewController(animated: true)
                // delete later self.performSegue(withIdentifier: "backSegue", sender: nil)
                // eli put this one in self.dismiss(animated: true, completion: nil)
            }
        }
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
