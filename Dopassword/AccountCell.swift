//
//  AccountCell.swift
//  Dopassword
//
//  Created by user190009 on 4/13/21.
//

import UIKit

class AccountCell: UITableViewCell {

    //manually changed name
    @IBOutlet weak var PhotoView: UIImageView!
    @IBOutlet weak var AccountName: UILabel!
    @IBOutlet weak var PasswordLabel: UILabel!
    @IBOutlet weak var UsernameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    @IBAction func onCopy(_ sender: UIButton) {
     
        UIPasteboard.general.string = (self.PasswordLabel.text!)
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
