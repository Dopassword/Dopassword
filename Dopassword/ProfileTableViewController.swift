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
    var accounts = [[String:Any]]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = 140
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        let query = PFQuery(className:"Accounts")
        query.includeKey("name")
        query.limit = 10
        
        query.findObjectsInBackground { (posts, error) in
            if posts != nil {
                self.posts = posts!
                self.tableView.reloadData()
            }
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AccountCell") as! AccountCell
        let post = posts[indexPath.row]

        cell.UsernameLabel.text = (post["name"] as! String)
        
        cell.PasswordLabel.text = (post["password"] as! String)
        
        cell.AccountName.text = (post["account"] as? String)
            
        let imageFile = post["image"] as! PFFileObject
        let urlString = imageFile.url!
        let url = URL(string: urlString)!
        
        cell.PhotoView.af.setImage(withURL: url)
        
        
        
        return cell
    }
          
    @IBAction func onCopy(_ sender: UIButton) {

        let cell = tableView.dequeueReusableCell(withIdentifier: "AccountCell") as! AccountCell
                   
        UIPasteboard.general.string = (cell.PasswordLabel.text!)
        
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

// if uncommented: creationview does not work, also unable to pass data since indexPath is out of range
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
//        print("Loading up the screen")
//
//        let cell = sender as! UITableViewCell
//        let indexPath = tableView.indexPath(for: cell)!
//        let post = accounts[indexPath.row + 1]
//
//        let detailViewController = segue.destination as! DetailViewController
//        detailViewController.account = post
//
//    }


}

