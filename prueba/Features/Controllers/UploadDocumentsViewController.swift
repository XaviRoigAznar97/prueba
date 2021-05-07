//
//  UploadDocumentsViewController.swift
//  prueba
//
//  Created by Leisure on 06/05/2021.
//

import UIKit
import MobileCoreServices

class UploadDocumentsViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var uploadDocumentsBtn: UIButton!
    @IBOutlet weak var continueBtn: UIButton!
    @IBOutlet weak var stackView: UIStackView!
    
    var viewModel = UploadDocumentsViewModel()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        titleLabel.text = viewModel.getTitleText()
        
        descriptionLabel.text = viewModel.getDescriptionText()
        
        uploadDocumentsBtn.setTitle(viewModel.getUploadBtnTitle(), for: .normal)
        
        continueBtn.setTitle(viewModel.getContinueBtnTitle(), for: .normal)
        
        continueBtn.isUserInteractionEnabled = false
        
        continueBtn.backgroundColor = .red
        
        configureStackView()
        
    }
    
    private func configureStackView() {
        
        let stackViewTitle = UILabel()
        
        stackViewTitle.text = viewModel.getStackViewTitle()
        stackViewTitle.font = UIFont(name: "GillSans-Bold", size: 20)
        stackViewTitle.textAlignment = .center
        
        stackView.addArrangedSubview(stackViewTitle)
        
    }
    
    private func enableContinueBtn() {
        
        continueBtn.isUserInteractionEnabled = true
        
        continueBtn.backgroundColor = .green
        
    }
    
    
    @IBAction func uploadDocumentsBtnPressed(_ sender: Any) {
        let documentPicker = UIDocumentPickerViewController(documentTypes: [kUTTypePlainText as String], in: .import)
        documentPicker.delegate = self
        documentPicker.allowsMultipleSelection = true
        documentPicker.modalPresentationStyle = .fullScreen
        
        present(documentPicker, animated: true, completion: nil)
    }
    
    
    @IBAction func continueBtnPressed(_ sender: Any) {
        
    }
}

extension UploadDocumentsViewController: UIDocumentPickerDelegate {
    
    func documentPicker(_ controller: UIDocumentPickerViewController, didPickDocumentsAt urls: [URL]) {
        
        for url in urls {
            
            do {
                
                if let documentData = try? Data(contentsOf: url) {
                    
                    let documentText = String(data: documentData, encoding: .utf8)
                    
                    enableContinueBtn()
                    
                }
                
            }
            
        }
        
    }
}

extension UploadDocumentsViewController: WordSearcherRelationshipProtocol {
    
    func configureViewModel(withManager manager: WordSearcherManager) {
        
        viewModel.manager = manager
    
    }
    
}
