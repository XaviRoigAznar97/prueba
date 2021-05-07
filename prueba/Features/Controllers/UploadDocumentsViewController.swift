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
    
    var viewModel = UploadDocumentsViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
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
        
    }
}

extension UploadDocumentsViewController: WordSearcherRelationshipProtocol {
    
    func configureViewModel(withManager manager: WordSearcherManager) {
        
        viewModel.manager = manager
    
    }
    
}
