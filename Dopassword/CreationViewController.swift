//
//  CreationViewController.swift
//  Dopassword
//
//  Created by user190009 on 4/17/21.
//

import UIKit
import AlamofireImage
import Parse

class CreationViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var usernameField: UITextField!
    
    @IBOutlet weak var passwordField: UITextField!
    
    @IBOutlet weak var accountField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    @IBAction func onRandom(_ sender: Any) {
        
        passwordField.text = randomString(length: 8)
        
    }
    
    func randomString(length : Int) -> String {
        let charSet = Array("ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890!@#$%^&*")
        var random = ""
        for _ in 1...length {
            random.append(charSet.randomElement()!)
        }
        return random
    }
        
    
    @IBAction func onSaveButton(_ sender: Any) {
        let account = PFObject(className: "Accounts")
        
        account["name"] = usernameField.text!
        account["password"] = passwordField.text!
        account["account"] = accountField.text!
        account["author"] = PFUser.current()
        
        let imageData = imageView.image!.pngData()
        let file = PFFileObject(data: imageData!)
        
        account["image"] = file
        
        account.saveInBackground{ (success, error) in
            if success {
                self.navigationController?.popViewController(animated: true)
                print("saved!")
            } else {
                print("Error!")
            }
        }
    }
    
    @IBAction func onLogoButton(_ sender: Any) {
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.allowsEditing = true
        
        ///video shows .camera instead of .photoLibrary
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
            picker.sourceType = .photoLibrary
        }
            else {
                picker.sourceType = .camera
            }
            
        present(picker, animated: true, completion: nil)
        }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let image = info[.editedImage] as! UIImage
        
        let size = CGSize(width: 300, height: 300)
        let scaledImage = image.af.imageScaled(to: size)
        
        imageView.image = scaledImage
        
        dismiss(animated: true, completion: nil)
        
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


