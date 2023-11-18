//
//  ViewController.swift
//  CodeTest
//
//  Created by Aye Myat Minn on 18/11/2023.
//

import UIKit

class ViewController: BaseViewController {
    
    @IBOutlet weak var btnStateAndDataManagement: UIButton!
    @IBOutlet weak var btnCodeManagement: UIButton!
    @IBOutlet weak var btnUIDesign: UIButton!
    
    let viewModel = ViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func bindViewModel() {
        super.bindViewModel()
        viewModel.bindViewModel(in: self)
    }
    
    @IBAction func didTapStateAndDataManagement(_ sender: Any) {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        if let vc = storyBoard.instantiateViewController(withIdentifier: DailyVitaViewController.identifier) as? DailyVitaViewController{
            
            vc.modalPresentationStyle = .fullScreen
            self.present(vc, animated: true, completion: nil)
        }
    }
    
    @IBAction func didTapCodeManagement(_ sender: Any) {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        if let vc = storyBoard.instantiateViewController(withIdentifier: MovieListTableViewController.identifier) as? MovieListTableViewController{
            
            vc.modalPresentationStyle = .fullScreen
            self.present(vc, animated: true, completion: nil)
        }
    }
    
    @IBAction func didTapUIDesign(_ sender: Any) {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        if let vc = storyBoard.instantiateViewController(withIdentifier: OceanViewController.identifier) as? OceanViewController {
            
            vc.modalPresentationStyle = .fullScreen
            self.present(vc, animated: true, completion: nil)
        }
    }


}

