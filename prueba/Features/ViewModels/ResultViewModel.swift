//
//  ResultViewModel.swift
//  prueba
//
//  Created by Leisure on 08/05/2021.
//

import UIKit

class ResultViewModel {

    var manager = WordSearcherManager.sharedInstance
    
    fileprivate (set) var selectedBtnType: ResultPageFilterButtonType?
    
    fileprivate (set) var cellModels = [WordFoundDescriptionCellModel]()
    
    fileprivate (set) var totalWordsCellModels = [WordFoundDescriptionCellModel]()
    
    func setSelectedBtnType(_ filterType: ResultPageFilterButtonType?) {
        
        selectedBtnType = filterType
        
    }
    
    func resetSelectedBtnType() {
        
        selectedBtnType = nil
    }
    
    func getTotalWordsDescription()-> String {
        
        return "Número total de palabras: \(manager.wordsCounter.description)"
        
    }
    
    func getFirstBtnTitle()-> String {
        
        return "Posición"
    
    }
    
    func getSecondBtnTitle()-> String {
    
        return "Alfabéticamente"
        
    }
    
    func getThirdBtnTitle()-> String {
        
        return "Apariciones"
        
    }
    
    func getHeaderCellModel()-> WordFoundHeaderCellModel {
        return WordFoundHeaderCellModel(wordTitle: "Palabra", documentTitle: "Documentos", appearancesTitle: "Apariciones")
    }
    
    //MARK: - Generate cell models with manager's word dictionary
    
    func generateCellModels() {
        
        for (_, wordModel) in manager.wordsFound {
            
            cellModels.append(WordFoundDescriptionCellModel(word: wordModel.word, documentsName: wordModel.documentNames, appearances: wordModel.counter, position: wordModel.position))
            
        }

        totalWordsCellModels = cellModels
        
    }
    
    //MARK: - Recover the initial list of words
    
    func recoverTotalCellModels() {
        
        cellModels = totalWordsCellModels
        
    }
    
    //MARK: - Sort the word models by position
    
    func refreshPositionFilteredCellModels() {
        
        cellModels = cellModels.sorted(by: {$0.position < $1.position})
        
    }
    
    //MARK: - Sort the word models alphabetically
    
    func refreshAlphabeticFilteredCellModels() {
        
        cellModels = cellModels.sorted(by: {$0.word < $1.word })
        
    }
    
    //MARK: - Sort the word models by number of appearances
    
    func refreshAppearancesFilteredCellModels() {
        
        cellModels = cellModels.sorted(by: {$0.appearances > $1.appearances })
        
    }
    
    //MARK: - Get cell model from the specified index
    
    func getCellModel(atIndex index: Int)-> WordFoundDescriptionCellModel? {
        
        guard index >= 0, index < cellModels.count else { return nil }
        
        return cellModels[index]
        
    }
    
    //MARK: - Create a new array of cellModels filtering the words from the manager's dictionary by the text introduced by the user in the searchBar
    
    func createCellModels(withFilteredWords text: String) {
        
        cellModels = []
        
        for (word, wordModel) in manager.wordsFound {
            
            if word.contains(text.capitalized) {
                
                cellModels.append(WordFoundDescriptionCellModel(word: wordModel.word, documentsName: wordModel.documentNames, appearances: wordModel.counter, position: wordModel.position))
                
            }
            
        }
        
        if let selectedBtnType = selectedBtnType {
            
            switch selectedBtnType {
            
            case .position:
                
                refreshPositionFilteredCellModels()
                break
                
            case .alphabetic:
                
                refreshAlphabeticFilteredCellModels()
                break
                
            case .appearances:
            
                refreshAppearancesFilteredCellModels()
                break
            
            }
            
        }
        
    }
}


enum ResultPageFilterButtonType {
    case position
    case alphabetic
    case appearances
}
