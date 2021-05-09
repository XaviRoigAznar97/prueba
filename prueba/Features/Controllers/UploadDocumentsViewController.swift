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
    
    var viewModel = UploadDocumentsViewModel()
    
    static func storyboardInstance()-> UploadDocumentsViewController? {
        
        if let viewController = UIStoryboard(name: "WordSearcherStoryboard", bundle: Bundle.main).instantiateViewController(withIdentifier: "UploadDocumentsViewController") as? UploadDocumentsViewController {
            
            return viewController
            
        }
        
        return nil
        
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        self.title = "Word Searcher"
        
        titleLabel.text = viewModel.getTitleText()
        
        descriptionLabel.text = viewModel.getDescriptionText()
        
        uploadDocumentsBtn.setTitle(viewModel.getUploadBtnTitle(), for: .normal)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(animated)
        
        viewModel.manager.reset()
        
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
                    
                    if let documentText = String(data: documentData, encoding: .utf8), let documentName = url.absoluteString.split(separator: "/").last {
                    
                        viewModel.processDocumentsSelected(documentText: documentText, documentName: String(documentName))
                        
                    }
                    
                }
                
            }
            
        }
        
        //MARK: - Navigate to next page
        
        if let resultViewController = ResultViewController.storyboardInstance() {
            
            self.navigationController?.pushViewController(resultViewController, animated: true)
            
        }
        
    }
}
