//
//  OceanViewController.swift
//  CodeTest
//
//  Created by Aye Myat Minn on 18/11/2023.
//

import UIKit

class OceanViewController: BaseViewController {
    
    @IBOutlet weak var btnBack: UIButton!
    @IBOutlet weak var contentTableView: UITableView!
    
    
    
    static var identifier : String {
        return String(describing:OceanViewController.self)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func setupUI() {
        super.setupUI()
        contentTableView.dataSource = self
        contentTableView.delegate = self
        contentTableView.register(UINib(nibName: OceanOneTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: OceanOneTableViewCell.identifier)
        contentTableView.register(UINib(nibName: OceanTwoTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: OceanTwoTableViewCell.identifier)
        contentTableView.register(UINib(nibName: OceanThreeTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: OceanThreeTableViewCell.identifier)
        contentTableView.register(UINib(nibName: OceanFourTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: OceanFourTableViewCell.identifier)
    }
    
    @IBAction func didTapBack(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}

extension OceanViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row % 2 == 0 {
            guard let cell = contentTableView.dequeueReusableCell(withIdentifier: OceanTwoTableViewCell.identifier, for: indexPath) as? OceanTwoTableViewCell else {
                return UITableViewCell()
            }
            return cell
        }else {
            guard let cell = contentTableView.dequeueReusableCell(withIdentifier: OceanThreeTableViewCell.identifier, for: indexPath) as? OceanThreeTableViewCell else {
                return UITableViewCell()
            }
            return cell
        }
    }
    
    
}
