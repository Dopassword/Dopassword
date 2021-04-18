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
    @IBOutlet weak var UsernameLabel: UILabel!
    @IBOutlet weak var PasswordLabel: UILabel!
    @IBOutlet weak var UsernameField: UILabel!
    @IBOutlet weak var PasswordField: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
