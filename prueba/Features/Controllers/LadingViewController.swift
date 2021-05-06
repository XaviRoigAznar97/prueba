//
//  LadingViewController.swift
//  prueba
//
//  Created by Leisure on 06/05/2021.
//

import UIKit

class LadingViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var button: UIButton!
    
    var viewModel = LandingViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        titleLabel.text = viewModel.getTitleLabelText()
        
        button.setTitle(viewModel.getButtonTitle(), for: .normal)
    }
    
    @IBAction func buttonPressed(_ sender: Any) {
        
    }
}
