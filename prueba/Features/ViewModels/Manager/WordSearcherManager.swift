//
//  WordSearcherManager.swift
//  prueba
//
//  Created by Leisure on 06/05/2021.
//

import UIKit

protocol WordSearcherRelationshipProtocol: class {
    func configureViewModel(withManager manager: WordSearcherManager)
}

class WordSearcherManager {
    
    static let validCharacters = "012345678"

    fileprivate (set) var rawDocumentsText = [String]()
    
    fileprivate (set) var wordsFound = [String: WordFoundModel]()
    
    fileprivate (set) var documentModels = [Any]()
    
    func setRawDocumentsText(_ text: String) {
        rawDocumentsText.append(text)
    }
    
    func processDocumentText(documentText: String, documentName: String, success succeed: (@escaping ()-> Void)) {
        
        let fileteredText = documentText.alphanumeric
        
        DispatchQueue.global().async { [weak self] in
            
            for (i, word) in fileteredText.enumerated() {
                
                let capitalizedWord = word.capitalized
                
                let wordModel = self?.createWordFoundModel(forWord: capitalizedWord, inDocument: documentName, inPosition: i)
                
                if let cachedWordModel = self?.wordsFound[capitalizedWord] {
                
                    cachedWordModel.updateCounter()
                    
                } else {
                    
                    self?.wordsFound[capitalizedWord] = wordModel
                
                }
                
            }
            
            succeed()
            
        }
    }
    
    private func createWordFoundModel(forWord word: String, inDocument documentName: String, inPosition position: Int)-> WordFoundModel {
        
        return WordFoundModel(word: word.capitalized, documentName: documentName, position: position)
        
    }
}

extension String {
    var alphanumeric: [String] {
        return self.components(separatedBy: CharacterSet.alphanumerics.inverted).filter{ $0.count > 0}
    }
}
