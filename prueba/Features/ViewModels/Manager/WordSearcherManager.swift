//
//  WordSearcherManager.swift
//  prueba
//
//  Created by Leisure on 06/05/2021.
//

import UIKit

class WordSearcherManager {

    static let sharedInstance = WordSearcherManager()
    
    fileprivate (set) var wordsFound = [String: WordFoundModel]()
    
    fileprivate (set) var wordsCounter = 0
    
    func reset() {
        
        wordsFound = [String: WordFoundModel]()
        
        wordsCounter = 0
        
    }
    
    func processDocumentText(documentText: String, documentName: String) {
        
        let fileteredText = documentText.alphanumeric
        
            
        for (i, word) in fileteredText.enumerated() {
            
            let capitalizedWord = word.capitalized
            
            let wordModel = self.createWordFoundModel(forWord: capitalizedWord, inDocument: documentName, inPosition: i + self.wordsCounter)
            
            if let cachedWordModel = self.wordsFound[capitalizedWord] {
            
                cachedWordModel.updateCounter()
                
            } else {
                
                self.wordsFound[capitalizedWord] = wordModel
            
            }
            
        }
        
        self.wordsCounter += fileteredText.count
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
