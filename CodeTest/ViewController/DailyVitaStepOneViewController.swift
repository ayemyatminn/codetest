//
//  DailyVitaStepOneViewController.swift
//  CodeTest
//
//  Created by Aye Myat Minn on 19/11/2023.
//

import UIKit
import Combine

class DailyVitaStepOneViewController: BaseViewController {
    
    @IBOutlet weak var btnBack: UIButton!
    @IBOutlet weak var healthConcernCollectionView: UICollectionView!
    @IBOutlet weak var selectedHelthConcernTableView: UITableView!
    @IBOutlet weak var progressBar: UIProgressView!
    
    let viewModel = DailyVitaStepOneViewModel()
    var healthConcerns: [HealthConcernVO]?
    var selectedData: [HealthConcernVO] = []
    var totalTime = 4
    
    static var identifier : String {
        return String(describing:DailyVitaStepOneViewController.self)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        setupCollectionView()
        setupTableView()
        getHealthConsernsList()
        getProgressBar()
    }
    
    func setupCollectionView() {
        healthConcernCollectionView.registerForCells(cells: HealthConcernsCollectionViewCell.self)
        healthConcernCollectionView.delegate = self
        healthConcernCollectionView.dataSource = self
        let layout = TagsLayout()
        healthConcernCollectionView.collectionViewLayout = layout
    }
    
    func setupTableView() {
        selectedHelthConcernTableView.registerForCells(cells: HealthCorcernTableViewCell.self)
        selectedHelthConcernTableView.delegate = self
        selectedHelthConcernTableView.dataSource = self
    }
    
    func getHealthConsernsList() {
        viewModel.getHealthConcernsData()
        
        viewModel.getHealthConcernsList.sink { [weak self] healthConcernsList in
            self?.healthConcerns = healthConcernsList
            self?.healthConcernCollectionView.reloadData()
        }
        .store(in: &bindings)
    }
    
    func getProgressBar() {
        progressBar.progress = Float(totalTime - 3) / Float(totalTime)
    }
    
    @IBAction func didTapBack(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func didTappedNext(_ sender: Any) {
        if selectedData.count >= 5 {
            let storyBoard = UIStoryboard(name: "Main", bundle: nil)
            if let vc = storyBoard.instantiateViewController(withIdentifier: DailyVitaStepTwoViewController.identifier) as? DailyVitaStepTwoViewController {
                vc.hearthConcernsList = selectedData
                vc.modalPresentationStyle = .fullScreen
                self.present(vc, animated: true, completion: nil)
            }
        }else{
            self.showToast(message: "Please select 5 or more")
        }
    }

}

extension DailyVitaStepOneViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout  {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return healthConcerns?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeReuseCell(type: HealthConcernsCollectionViewCell.self, indexPath: indexPath)
        cell.labelName.text = healthConcerns?[indexPath.row].name
        cell.index = indexPath.row
        cell.hearthConcerns = healthConcerns?[indexPath.row]
        if let isSelected =  healthConcerns?[indexPath.row].isSelected {
            cell.isSelectedItem = isSelected
        }
        cell.delegte = self
        return cell
    }
}

extension DailyVitaStepOneViewController: HealthConcernsCollectionViewCellProtocol {
    
    func toAdd(index: Int, HearthConcerns: HealthConcernVO) {
        let filter = selectedData.filter { data in
            return data.id == HearthConcerns.id
        }
        if filter.isEmpty {
            healthConcerns?[index].isSelected = true
            selectedData.append(HearthConcerns)
            healthConcernCollectionView.reloadItems(at: [IndexPath(item: index, section: 0)])
            selectedHelthConcernTableView.reloadData()
        } else {
            healthConcerns?[index].isSelected = false
            let name = healthConcerns?[index].name
            let foundIndex = selectedData.firstIndex(where: { data in
                if data.name == name {
                    return true
                }
                return false
            }) ?? 0
            selectedData.remove(at: foundIndex)
            healthConcernCollectionView.reloadItems(at: [IndexPath(item: index, section: 0)])
            selectedHelthConcernTableView.reloadData()
        }
    }
}

extension DailyVitaStepOneViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        selectedData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeReuseCell(type: HealthCorcernTableViewCell.self, indexPath: indexPath)
        cell.nameLabel.text = selectedData[indexPath.row].name
        return cell
    }
}

