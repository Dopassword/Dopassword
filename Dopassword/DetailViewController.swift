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

    var post: [String:Any]!
    
    @IBOutlet weak var appNameUpdate: UITextField!
    
    @IBOutlet weak var passwordUpdate: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
        
    let account = PFObject(className: "Accounts")
    

   
    @IBAction func onSaveButton(_ sender: Any) {
        
        account["password"] = passwordUpdate.text!
        account["account"] = appNameUpdate.text!
        
        account.saveInBackground{ (success, error) in
            if success {
                self.dismiss(animated: true, completion: nil)
                print("saved!")
            } else {
                print("Error!")
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

}
}
