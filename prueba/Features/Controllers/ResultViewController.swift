//
//  ResultViewController.swift
//  prueba
//
//  Created by Leisure on 08/05/2021.
//

import UIKit

class ResultViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var firstButton: UIButton!
    @IBOutlet weak var secondButton: UIButton!
    @IBOutlet weak var thirdButton: UIButton!
    @IBOutlet weak var tableView: UITableView!
    
    var viewModel = ResultViewModel()
    
    static func storyboardInstance()-> ResultViewController? {
        if let vC = UIStoryboard(name: "WordSearcherStoryboard", bundle: Bundle.main).instantiateViewController(withIdentifier: "ResultViewController") as? ResultViewController {
            
            return vC
            
        }
        
        return nil
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func firstBtnPressed(_ sender: Any) {
    }
    
    @IBAction func secondBtnPressed(_ sender: Any) {
    }
    
    @IBAction func thirdBtnPressed(_ sender: Any) {
    }
}

extension ResultViewController: WordSearcherRelationshipProtocol {
    func configureViewModel(withManager manager: WordSearcherManager) {
        viewModel.manager = manager
    }
}
