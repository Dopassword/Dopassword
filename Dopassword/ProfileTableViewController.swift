//
//  ProfileTableViewController.swift
//  Dopassword
//
//  Created by user190009 on 4/13/21.
//

import UIKit
import Parse
import AlamofireImage

//parstagram 6 10:30
class ProfileTableViewController: UITableViewController {
    //missing something, parstagram 6 querying posts 10:15

    
    
    var posts = [PFObject]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("Hello")
        let query = PFQuery(className:"Accounts")
        query.includeKey("name")
        query.limit = 10
        
        query.findObjectsInBackground { (posts, error) in
            if posts != nil {
                self.posts = posts!
                print(self.posts)
                self.tableView.reloadData()
            }
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }

    func tablewView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print("Test2")
        let cell = tableView.dequeueReusableCell(withIdentifier: "AccountCell") as! AccountCell
        print("Test1")
        let post = posts[indexPath.row]
        print(posts)
        //let user = post["name"] as! String
        cell.UsernameLabel.text = post["name"] as! String
        
        cell.PasswordLabel.text = (post["password"] as! String)
            
        let imageFile = post["image"] as! PFFileObject
        let urlString = imageFile.url!
        let url = URL(string: urlString)!
        
        cell.PhotoView.af.setImage(withURL: url)
        
        return cell
    }
    
    @IBAction func onLogout(_ sender: Any) {
        
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
        return 1
    }


//    override func viewDidAppear(_ animated: Bool) {
//        super.viewDidAppear(animated)
//
//        let query = PFQuery(className:"Posts")
//        query.includeKeys(["username", "password", "password.username"])
//        query.limit = 10
//
//        query.findObjectsInBackground { (posts, error) in
//            if posts != nil {
//                self.posts = posts!
//               // self.tableView.reloadData() //add connection later
//            }
//        }


}

