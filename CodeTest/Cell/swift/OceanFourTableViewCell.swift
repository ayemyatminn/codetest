//
//  OceanFourTableViewCell.swift
//  CodeTest
//
//  Created by Aye Myat Minn on 18/11/2023.
//

import UIKit

class OceanFourTableViewCell: UITableViewCell {
    
    @IBOutlet weak var showCollectionView: UICollectionView!
    
    static var identifier : String {
        return String(describing : OceanFourTableViewCell.self)
    }

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }
}

//extension OceanFourTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
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
