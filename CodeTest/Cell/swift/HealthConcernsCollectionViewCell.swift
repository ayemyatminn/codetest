//
//  HealthConcernsCollectionViewCell.swift
//  CodeTest
//
//  Created by Aye Myat Minn on 19/11/2023.
//

import Foundation
import UIKit

protocol HealthConcernsCollectionViewCellProtocol: AnyObject {
    func toAdd(index: Int, HearthConcerns: HealthConcernVO)
}

class HealthConcernsCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var bgView: UIView!
    @IBOutlet weak var labelName: UILabel!
    weak var delegte: HealthConcernsCollectionViewCellProtocol?
    
    var index: Int?
    var hearthConcerns: HealthConcernVO?
    
    var isSelectedItem: Bool = false {
        didSet {
            bgView.layer.backgroundColor = isSelectedItem ? UIColor.primaryColor.cgColor : UIColor.clear.cgColor
            labelName.textColor = isSelectedItem ? UIColor.white : UIColor.primaryColor
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
    }
    
    func setupUI() {
        labelName.textColor = UIColor.primaryColor
        bgView.layer.cornerRadius = 15
        bgView.layer.borderWidth = 1
        bgView.layer.borderColor = UIColor.primaryColor.cgColor
    }
    
    @IBAction func didTapAdd(_ sender: Any) {
        self.delegte?.toAdd(index: index ?? 0, HearthConcerns: hearthConcerns!)
    }
}
