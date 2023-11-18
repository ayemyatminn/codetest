//
//  DailyVitaStepThreeViewController.swift
//  CodeTest
//
//  Created by Aye Myat Minn on 19/11/2023.
//

import UIKit

class DailyVitaStepThreeViewController: BaseViewController {

    @IBOutlet weak var btnBack: UIButton!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var heightConstraint: NSLayoutConstraint!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var progressBar: UIProgressView!
    
    var viewModel = DailyVitaStepThreeViewModel()
    var isSearching: Bool = false
    var hearthConcernsList: [HealthConcernVO] = []
    var dietsList: [DietsVO] = []
    var allergiesList: [AllergiesVO] = []
    var searchResult: [AllergiesVO] = []
    var selectedData: [AllergiesVO] = []
    var totalTime = 4
    
    static var identifier : String {
        return String(describing:DailyVitaStepThreeViewController.self)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func setUptableView() {
        tableView.registerForCells(cells: AllergiesTableViewCell.self)
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func setUpCollectionView() {
        collectionView.registerForCells(cells: HealthConcernsCollectionViewCell.self)
        collectionView.delegate = self
        collectionView.dataSource = self
        let layout = TagsLayout()
        collectionView.collectionViewLayout = layout
        view.layoutIfNeeded()
    }
    
    func getProgressBar() {
        progressBar.progress = Float(totalTime - 1) / Float(totalTime)
    }
    
    func getAllergiesList() {
        viewModel.getAllergiesData()
        
        viewModel.getAllergiesList.sink { [weak self] allergiesList in
            self?.allergiesList = allergiesList
            self?.tableView.reloadData()
        }
        .store(in: &bindings)
    }
    
    @IBAction func didTapBack(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func didTappedNext(_ sender: Any) {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        if let vc = storyBoard.instantiateViewController(withIdentifier: DailyVitaStepFourViewController.identifier) as? DailyVitaStepFourViewController {
            vc.hearthConcernsList = hearthConcernsList
            vc.dietsList = dietsList
            vc.alliergiesList = selectedData
            vc.modalPresentationStyle = .fullScreen
            self.present(vc, animated: true, completion: nil)
        }
    }
}

extension DailyVitaStepThreeViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        searchResult.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeReuseCell(type: AllergiesTableViewCell.self, indexPath: indexPath)
        cell.nameLabel.text = searchResult[indexPath.row].name
        cell.index = indexPath.row
        cell.allergies = searchResult[indexPath.row]
        cell.delegate = self
        return cell
    }
}

extension DailyVitaStepThreeViewController: UITextFieldDelegate {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let currentText = textField.text ?? ""
        guard let stringRange = Range(range, in: currentText) else { return false }
        let updatedText = currentText.replacingCharacters(in: stringRange, with: string)
        self.isSearching = updatedText.count > 0
        searchResult = allergiesList.filter {
            return $0.name.uppercased().contains(updatedText.uppercased())
        }
        isEmptyOrHaveData(isSearching: self.isSearching)
        return true
    }
    
    func isEmptyOrHaveData(isSearching: Bool) {
        if isSearching {
            tableView.isHidden = searchResult.isEmpty ? true : false
        }
        tableView.reloadData()
    }
}

extension DailyVitaStepThreeViewController: AllergiesTableViewCellProtocol {
    
    func toAdd(index: Int, allergies: AllergiesVO) {
        let filter = selectedData.filter { data in
            return data.id == allergies.id
        }
        if filter.isEmpty {
            selectedData.append(allergies)
            let height = self.collectionView.collectionViewLayout.collectionViewContentSize.height
            if heightConstraint.constant > UIScreen.main.bounds.size.height * 0.2  {
                self.heightConstraint.constant = UIScreen.main.bounds.size.height * 0.2
            }
            if heightConstraint.constant < UIScreen.main.bounds.size.height * 0.2  {
                self.heightConstraint.constant = height + 60
                self.view.layoutIfNeeded()
            }
            collectionView.reloadData()
        }
    }
}

extension DailyVitaStepThreeViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return selectedData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeReuseCell(type: HealthConcernsCollectionViewCell.self, indexPath: indexPath)
        cell.labelName.text = selectedData[indexPath.row].name
        cell.labelName.textColor = .white
        cell.bgView.backgroundColor = UIColor.primaryColor
        return cell
    }
}
