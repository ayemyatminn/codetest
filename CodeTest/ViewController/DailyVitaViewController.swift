//
//  DailyVitaViewController.swift
//  CodeTest
//
//  Created by Aye Myat Minn on 19/11/2023.
//

import UIKit

class DailyVitaViewController: BaseViewController {
    
    @IBOutlet weak var btnBack: UIButton!
    @IBOutlet weak var btnGetStarted: UIButton!
    
    static var identifier : String {
        return String(describing:DailyVitaViewController.self)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func didTapBack(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func didGetStarted(_ sender: Any) {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        if let vc = storyBoard.instantiateViewController(withIdentifier: DailyVitaStepOneViewController.identifier) as? DailyVitaStepOneViewController {
            
            vc.modalPresentationStyle = .fullScreen
            self.present(vc, animated: true, completion: nil)
        }
    }
    
}
