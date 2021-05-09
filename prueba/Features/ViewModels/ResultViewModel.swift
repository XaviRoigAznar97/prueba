//
//  ResultViewModel.swift
//  prueba
//
//  Created by Leisure on 08/05/2021.
//

import UIKit

class ResultViewModel {

    var manager: WordSearcherManager?
    
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
        guard let manager = manager else { return "Número total de palabras: 0" }
        return "Número total de palabras: \(manager.wordsCounter.description)"
    }
    
    func getFirstBtnTitle()-> String {
        return "Posición"
    }
    
    func getSecondBtnTitle()-> String {
        return "Alfabéticamente"
    }
    
    func getThirdBtnTitle()-> String {
        return "Aparaciones"
    }
    
    func getHeaderCellModel()-> WordFoundHeaderCellModel {
        return WordFoundHeaderCellModel(wordTitle: "Palabra", documentTitle: "Documentos", appearancesTitle: "Apariciones")
    }
    
    func generateCellModels() {
        
        guard let manager = manager else { return }
        
        for (_, wordModel) in manager.wordsFound {
            
            cellModels.append(WordFoundDescriptionCellModel(word: wordModel.word, documentsName: wordModel.documentNames, appearances: wordModel.counter, position: wordModel.position))
            
        }

        totalWordsCellModels = cellModels
        
    }
    
    func recoverTotalCellModels() {
        
        cellModels = totalWordsCellModels
        
    }
    
    func refreshPositionFilteredCellModels() {
        
        cellModels = cellModels.sorted(by: {$0.position < $1.position})
        
    }
    
    func refreshAlphabeticFilteredCellModels() {
        
        cellModels = cellModels.sorted(by: {$0.word < $1.word })
        
    }
    
    func refreshAppearancesFilteredCellModels() {
        
        cellModels = cellModels.sorted(by: {$0.appearances > $1.appearances })
        
    }
    
    func getCellModel(atIndex index: Int)-> WordFoundDescriptionCellModel? {
        
        guard index >= 0, index < cellModels.count else { return nil }
        
        return cellModels[index]
        
    }
    
    func createCellModels(withFilteredWords text: String) {
        
        guard let manager = manager else { return }
        
        cellModels = []
        
        for (word, wordModel) in manager.wordsFound {
            
            if word.contains(text.capitalized) {
                
                cellModels.append(WordFoundDescriptionCellModel(word: wordModel.word, documentsName: wordModel.documentNames, appearances: wordModel.counter, position: wordModel.position))
                
            }
            
        }
    }
}


enum ResultPageFilterButtonType {
    case position
    case alphabetic
    case appearances
}
