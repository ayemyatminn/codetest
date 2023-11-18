//
//  DailyVitaStepFourViewController.swift
//  CodeTest
//
//  Created by Aye Myat Minn on 19/11/2023.
//

import UIKit
import DLRadioButton

class DailyVitaStepFourViewController: BaseViewController {
    
    @IBOutlet weak var btnSunYes: DLRadioButton!
    @IBOutlet weak var btnSunNo: DLRadioButton!
    @IBOutlet weak var btnSmokeYes: DLRadioButton!
    @IBOutlet weak var btnSmokeNo: DLRadioButton!
    @IBOutlet weak var btnZeroOne: DLRadioButton!
    @IBOutlet weak var btnTwoFive: DLRadioButton!
    @IBOutlet weak var btnFivePlus: DLRadioButton!
    @IBOutlet weak var progressBar: UIProgressView!
    
    var hearthConcernsList: [HealthConcernVO] = []
    var dietsList: [DietsVO] = []
    var alliergiesList: [AllergiesVO] = []
    var sunLimit: Bool?
    var smoke: Bool?
    var alcoho: String?
    var totalTime = 4
    
    static var identifier : String {
        return String(describing:DailyVitaStepFourViewController.self)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        getProgressBar()
    }
    
    func getProgressBar() {
        progressBar.progress = Float(totalTime) / Float(totalTime)
    }
    
    
    @IBAction func didTapSunYes(_ sender: Any) {
        sunLimit = true
    }
    
    @IBAction func didTapSunNo(_ sender: Any) {
        sunLimit = false
    }
    
    @IBAction func didTappedSmokeYes(_ sender: Any) {
        smoke = true
    }
    
    @IBAction func didTappedSmokeNo(_ sender: Any) {
        smoke = false
        
    }
    
    @IBAction func didTappedZeroOne(_ sender: UIButton) {
        alcoho = sender.titleLabel?.text
    }
    
    @IBAction func didTappedTwoFive(_ sender: UIButton) {
        alcoho = sender.titleLabel?.text
    }

    @IBAction func didTappedFivePlus(_ sender: UIButton) {
        alcoho = sender.titleLabel?.text
    }
    
    @IBAction func didTappedGetMyVitamin(_ sender: Any) {
        if smoke != nil && alcoho != "" && sunLimit != nil {
            let result = ResultVO(health_concerns: hearthConcernsList,
                                          diets: dietsList,
                                          is_daily_exposure: sunLimit ?? false,
                                          is_smoke: smoke ?? false,
                                          alchol: alcoho ?? "",
                                          allergies: alliergiesList)
            
            let encoder = JSONEncoder()
            do {
                let data = try encoder.encode(result)
                let string: String? = String(data: data, encoding: .utf8)
                print(string)
            } catch {
                print("Uncode Error")
            }
        } else {
            self.showToast(message: "Need To Selected Above Questions")
        }
    }

}
