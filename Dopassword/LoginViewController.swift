//
//  LoginViewController.swift
//  Dopassword
//
//  Created by Randy  Nguyen on 4/6/21.
//

import UIKit
import Parse


class LoginViewController: UIViewController {

    

    @IBOutlet weak var usernameField: UITextField!
    
    @IBOutlet weak var passwordField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    
    @IBAction func LoginButton(_ sender: Any) {
        
        
    }

    @IBAction func RegisterButton(_ sender: Any) {
        
        let user = PFUser()
        user.username = usernameField.text
        user.password = passwordField.text
        user.signUpInBackground { (success, error) in
            if success {
                self.performSegue(withIdentifier: "LoginSegue", sender: nil)
            } else {
                print("Error:\(String(describing: error?.localizedDescription))")
            }
            // Finish Segue
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