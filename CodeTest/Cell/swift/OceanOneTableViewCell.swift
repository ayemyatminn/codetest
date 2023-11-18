//
//  OceanOneTableViewCell.swift
//  CodeTest
//
//  Created by Aye Myat Minn on 18/11/2023.
//

import UIKit

class OceanOneTableViewCell: UITableViewCell {
    
    @IBOutlet weak var pagerCollectionView: UICollectionView!
    
    static var identifier : String {
        return String(describing : OceanOneTableViewCell.self)
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }
    
}

//extension OceanOneTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return 3
//    }
//    
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        <#code#>
//    }
//    
//    
//}
