//
//  WordSearcherManager.swift
//  prueba
//
//  Created by Leisure on 06/05/2021.
//

import UIKit

class WordSearcherManager {

    static let sharedInstance = WordSearcherManager()
    
    //MARK: - Use a dicitonary because it has a lower cost that and array of models (we can identify the words with the dictionary key)
    
    fileprivate (set) var wordsFound = [String: WordFoundModel]()
    
    fileprivate (set) var wordsCounter = 0
    
    func reset() {
        
        //MARK: - Reset the dictionary and the counter with the words saved from selected files
        
        wordsFound = [String: WordFoundModel]()
        
        wordsCounter = 0
        
    }
    
    func processDocumentText(documentText: String, documentName: String) {
        
        let fileteredText = documentText.alphanumeric
        
        for (i, word) in fileteredText.enumerated() {
            
            //MARK: - Word capitalized to follow a single pattern
            
            let capitalizedWord = word.capitalized
            
            let wordModel = self.createWordFoundModel(forWord: capitalizedWord, inDocument: documentName, inPosition: i + self.wordsCounter)
            
            if let cachedWordModel = self.wordsFound[capitalizedWord] {
            
                //MARK: - Increase plus one the counter of the word
                
                cachedWordModel.updateCounter()
                
            } else {
                
                //MARK: - Create the pair (key, value) if it does not exist
                
                self.wordsFound[capitalizedWord] = wordModel
            
            }
            
        }
        
        self.wordsCounter += fileteredText.count
        
    }
    
    //MARK: - Create Word Models with the data extracted from the text
    
    private func createWordFoundModel(forWord word: String, inDocument documentName: String, inPosition position: Int)-> WordFoundModel {
        
        return WordFoundModel(word: word.capitalized, documentName: documentName, position: position)
        
    }
    
}

extension String {
    
    //MARK: - Extension that filters only alphanumeric characters
    
    var alphanumeric: [String] {
        return self.components(separatedBy: CharacterSet.alphanumerics.inverted).filter{ $0.count > 0}
    }
}
