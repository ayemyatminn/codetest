//
//  AllergiesTableViewCell.swift
//  CodeTest
//
//  Created by Aye Myat Minn on 19/11/2023.
//

import Foundation
import UIKit

protocol AllergiesTableViewCellProtocol: AnyObject {
    func toAdd(index: Int, allergies: AllergiesVO)
}

class AllergiesTableViewCell: UITableViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    weak var delegate: AllergiesTableViewCellProtocol?
    
    var index: Int?
    var allergies: AllergiesVO?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    @IBAction func didTappedSelect(_ sender: Any) {
        self.delegate?.toAdd(index: index!, allergies: allergies!)
    }
}
