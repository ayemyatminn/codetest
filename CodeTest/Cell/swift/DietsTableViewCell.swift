//
//  DietsTableViewCell.swift
//  CodeTest
//
//  Created by Aye Myat Minn on 19/11/2023.
//

import Foundation
import UIKit
import DLRadioButton

protocol DietsTableViewCellProtocol: AnyObject {
    func toAdd(index: Int, diets: DietsVO)
    func toRemove(index: Int, diets: DietsVO)
    func didTappedInfo(sender: UIButton, index: Int)
}

class DietsTableViewCell: UITableViewCell {
    
    @IBOutlet weak var wholeBtn: DLRadioButton!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var infoBtn: UIButton!
    weak var delegte: DietsTableViewCellProtocol?
    
    var index: Int?
    var diets: DietsVO?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        wholeBtn.isMultipleSelectionEnabled = true
    }
    
    @IBAction func didTappedSelected(_ sender: DLRadioButton) {
        if wholeBtn.isSelected == true   {
            self.delegte?.toAdd(index: index!, diets: diets!)
        } else {
            self.delegte?.toRemove(index: index!, diets: diets!)
        }
    }
    
    @IBAction func didTappedMoreInfo(_ sender: UIButton) {
        self.delegte?.didTappedInfo(sender: sender, index: index!)
    }
    
    
}
