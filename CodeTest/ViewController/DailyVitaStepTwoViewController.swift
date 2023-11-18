//
//  DailyVitaStepTwoViewController.swift
//  CodeTest
//
//  Created by Aye Myat Minn on 19/11/2023.
//

import UIKit

class DailyVitaStepTwoViewController: BaseViewController {

    @IBOutlet weak var btnBack: UIButton!
    @IBOutlet weak var dietTableView: UITableView!
    @IBOutlet weak var progressBar: UIProgressView!
    
    var viewModel = DailyVitaStepTwoViewModel()
    var dietsList: [DietsVO]?
    var selectedData: [DietsVO] = []
    var hearthConcernsList: [HealthConcernVO] = []
    var totalTime = 4
    
    static var identifier : String {
        return String(describing:DailyVitaStepTwoViewController.self)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        setUptableView()
        getDietsList()
        getProgressBar()
    }
    
    func setUptableView() {
        dietTableView.registerForCells(cells: DietsTableViewCell.self)
        dietTableView.delegate = self
        dietTableView.dataSource = self
    }
    
    func getProgressBar() {
        progressBar.progress = Float(totalTime - 2) / Float(totalTime)
    }
    
    func getDietsList() {
        viewModel.getDietsData()
        viewModel.getDietsList.sink { [weak self] dietsList in
            self?.dietsList = dietsList
            self?.dietTableView.reloadData()
        }
        .store(in: &bindings)
    }
    
    @IBAction func didTapBack(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func didTappedNext(_ sender: Any) {
        if selectedData.count > 0 {
            let storyBoard = UIStoryboard(name: "Main", bundle: nil)
            if let vc = storyBoard.instantiateViewController(withIdentifier: DailyVitaStepThreeViewController.identifier) as? DailyVitaStepThreeViewController {
                vc.hearthConcernsList = hearthConcernsList
                vc.dietsList = selectedData
                vc.modalPresentationStyle = .fullScreen
                self.present(vc, animated: true, completion: nil)
            }
        }else {
            self.showToast(message: "Please select 1 Or More")
        }
    }
}

extension DailyVitaStepTwoViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        dietsList?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeReuseCell(type: DietsTableViewCell.self, indexPath: indexPath)
        cell.name.text = dietsList?[indexPath.row].name
        cell.index = indexPath.row
        cell.diets = dietsList?[indexPath.row]
        cell.delegte = self
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
}

extension DailyVitaStepTwoViewController: DietsTableViewCellProtocol {
    
    func toAdd(index: Int, diets: DietsVO) {
        selectedData.append(diets)
    }
    
    func toRemove(index: Int, diets: DietsVO) {
        let id = dietsList?[index].id
        let foundIndex = selectedData.firstIndex { data in
            if data.id == id {
                return true
            }
            return false
        } ?? 0
        selectedData.remove(at: foundIndex)
    }
    
    func didTappedInfo(sender: UIButton, index: Int) {
        
    }
}
