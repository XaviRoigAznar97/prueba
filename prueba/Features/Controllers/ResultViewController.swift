//
//  ResultViewController.swift
//  prueba
//
//  Created by Leisure on 08/05/2021.
//

import UIKit

class ResultViewController: UIViewController {

    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var firstButton: UIButton!
    @IBOutlet weak var secondButton: UIButton!
    @IBOutlet weak var thirdButton: UIButton!
    @IBOutlet weak var tableView: UITableView!
    
    var viewModel = ResultViewModel()
    
    static func storyboardInstance()-> ResultViewController? {
        if let vC = UIStoryboard(name: "WordSearcherStoryboard", bundle: Bundle.main).instantiateViewController(withIdentifier: "ResultViewController") as? ResultViewController {
            
            vC.title = "Word Searcher"
            
            return vC
            
        }
        
        return nil
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchBar.delegate = self
        
        configureButtons()

        configureTableView()
        
        titleLabel.text = viewModel.getTotalWordsDescription()
        
        titleLabel.font = UIFont(name: "GillSans-Bold", size: 20)
        
    }
    
    private func configureButtons() {
        
        firstButton.setTitle(viewModel.getFirstBtnTitle(), for: .normal)
        
        firstButton.tintColor = .black
        
        firstButton.backgroundColor = .red
        
        secondButton.setTitle(viewModel.getSecondBtnTitle(), for: .normal)
        
        secondButton.tintColor = .black
        
        secondButton.backgroundColor = .red
        
        thirdButton.setTitle(viewModel.getThirdBtnTitle(), for: .normal)
        
        thirdButton.tintColor = .black
        
        thirdButton.backgroundColor = .red
        
    }
    
    private func configureTableView() {
        
        viewModel.generateCellModels()
        
        tableView.bounces = false
        
        tableView.register(UINib(nibName: "WordFoundHeaderTableViewCell", bundle: Bundle.main), forCellReuseIdentifier: "WordFoundHeaderCell")

        tableView.register(UINib(nibName: "WordFoundDescriptionTableViewCell", bundle: Bundle.main), forCellReuseIdentifier: "WordFoundDescriptionCell")
        
        tableView.delegate = self
        
        tableView.dataSource = self
        
        tableView.reloadData()
        
    }
    
    private func activateSelectedButton(_ filterType: ResultPageFilterButtonType?) {
        
        viewModel.setSelectedBtnType(filterType)
        
        guard let type = filterType else { return }
        
        var btnSelected: UIButton?
        
        switch type {
        
        case .position:
            
            btnSelected = firstButton
            break
            
        case .alphabetic:
            
            btnSelected = secondButton
            break
            
        case .appearances:
            
            btnSelected = thirdButton
            break
            
        }
        
        if let btn = btnSelected {
            
            btn.tintColor = .white
            
            btn.backgroundColor = .green
            
        }
        
    }
    
    private func desactivateButton(_ filterType: ResultPageFilterButtonType?) {
        
        guard let type = filterType else { return }
        
        var btnDeselected: UIButton?
        
        switch type {
        
        case .position:
            
            btnDeselected = firstButton
            break
            
        case .alphabetic:
            
            btnDeselected = secondButton
            break
            
        case .appearances:
            
            btnDeselected = thirdButton
            break
            
        }
        
        if let btn = btnDeselected {
            
            btn.tintColor = .black
            
            btn.backgroundColor = .red
            
        }
        
    }
    
    @IBAction func firstBtnPressed(_ sender: Any) {
        
        desactivateButton(viewModel.selectedBtnType)
        
        if viewModel.selectedBtnType != .position {
            
            activateSelectedButton(.position)
            
            viewModel.refreshPositionFilteredCellModels()
            
        } else {
            
            viewModel.resetSelectedBtnType()
            
            viewModel.recoverTotalCellModels()
            
        }
        
        tableView.reloadData()
        
    }
    
    @IBAction func secondBtnPressed(_ sender: Any) {
        
        desactivateButton(viewModel.selectedBtnType)
        
        if viewModel.selectedBtnType != .alphabetic {
            
            activateSelectedButton(.alphabetic)
            
            viewModel.refreshAlphabeticFilteredCellModels()
            
        } else {
            
            viewModel.resetSelectedBtnType()
            
            viewModel.recoverTotalCellModels()
            
        }
        
        tableView.reloadData()
    }
    
    @IBAction func thirdBtnPressed(_ sender: Any) {
        
        desactivateButton(viewModel.selectedBtnType)
        
        if viewModel.selectedBtnType != .appearances {
        
            activateSelectedButton(.appearances)
            
            viewModel.refreshAppearancesFilteredCellModels()
        
        } else {
            
            viewModel.resetSelectedBtnType()
            
            viewModel.recoverTotalCellModels()
            
        }
        
        tableView.reloadData()
        
    }
    
}

extension ResultViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if section == 0 {
        
            return 1
            
        } else {
            
            return viewModel.cellModels.count
            
        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0, let cell = tableView.dequeueReusableCell(withIdentifier: "WordFoundHeaderCell", for: indexPath) as? WordFoundHeaderTableViewCell {
            
            cell.configureCell(withModel: viewModel.getHeaderCellModel())
            
            return cell
            
        } else if let cellModel = viewModel.getCellModel(atIndex: indexPath.row), let cell = tableView.dequeueReusableCell(withIdentifier: "WordFoundDescriptionCell", for: indexPath) as? WordFoundDescriptionTableViewCell {
            
            cell.configureCell(withModel: cellModel)
            
            return cell
            
        }
        
        return UITableViewCell()
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        if let cellModel = viewModel.getCellModel(atIndex: indexPath.row), cellModel.documentsName.count > 1 {
            
            return 80
        
        }
        
        return 50
        
    }
    
}

extension ResultViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        if searchText.count == 0 {
            
            viewModel.recoverTotalCellModels()
            
        } else {
        
            viewModel.createCellModels(withFilteredWords: searchText)
        
        }
        
        tableView.reloadData()
        
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        
        viewModel.recoverTotalCellModels()
        
        tableView.reloadData()
        
    }
    
}
