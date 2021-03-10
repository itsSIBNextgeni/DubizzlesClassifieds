//
//  DetailsTableViewCell.swift
//  DubizzlesClassifieds
//
//  Created Shahzaib Iqbal Bhatti on 08/03/2021.
//

import UIKit

class DetailsTableViewCell: UITableViewCell {

    @IBOutlet weak var priceLable: UILabel!
    @IBOutlet weak var titleLable: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
    }
}
