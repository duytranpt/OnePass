//
//  OPCell.swift
//  OnePass
//
//  Created by Duy Tran on 01/11/2022.
//

import UIKit

class OPCell: UITableViewCell {

    @IBOutlet weak var showPass: UIButton!
    @IBOutlet weak var passWord: UILabel!
    @IBOutlet weak var displayName: UILabel!
    @IBOutlet weak var icon: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    func fillData(data: PassModel) {
        displayName.text = data.app
        passWord.text = data.passWord
    }
    
}
