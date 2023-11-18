//
//  MovieDetailViewController.swift
//  CodeTest
//
//  Created by Aye Myat Minn on 18/11/2023.
//

import UIKit

class MovieDetailViewController: BaseViewController {
    
    @IBOutlet private weak var btnBack: UIButton!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var overviewLabel: UILabel!
    
    var selectedMovie: MovieVO!
    
    static var identifier : String {
        return String(describing:MovieDetailViewController.self)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func setupUI() {
        super.setupUI()
        titleLabel.text = selectedMovie.title
        overviewLabel.text = selectedMovie.overview
    }
    
    @IBAction func didTapBack(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }

}
