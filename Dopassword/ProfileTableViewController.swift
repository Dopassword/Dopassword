//
//  ProfileTableViewController.swift
//  Dopassword
//
//  Created by user190009 on 4/13/21.
//

import UIKit
import Parse
import AlamofireImage

class ProfileTableViewController: UITableViewController {

    var posts = [PFObject]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func onLogout(_ sender: Any) {
        
        print ("hello")
        
        PFUser.logOut()

//        let main = UIStoryboard(name: "Main", bundle: nil)
//
//        let loginViewController = main.instantiateViewController(identifier: "LoginViewController")
//
//
//        guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene, let delegate = windowScene.delegate as? SceneDelegate else { return }

        //delegate.window?.rootViewContoller = loginViewController
        performSegue(withIdentifier: "toLoginScreen", sender: nil)
        
    }
    
  
//
//    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        let query = PFQuery(className:"Posts")
        query.includeKeys(["username", "password", "password.username"])
        query.limit = 10
        
        query.findObjectsInBackground { (posts, error) in
            if posts != nil {
                self.posts = posts!
               // self.tableView.reloadData() //add connection later
            }
        }


}
}
