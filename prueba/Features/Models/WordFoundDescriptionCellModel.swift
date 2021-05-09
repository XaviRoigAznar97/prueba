//
//  WordFoundDescriptionCellModel.swift
//  prueba
//
//  Created by Leisure on 08/05/2021.
//

import UIKit

class WordFoundDescriptionCellModel: WordFoundBaseCellModel {
    
    var word: String
    var documentsName: [String]
    var appearances: Int
    var position: Int
    
    init(word: String, documentsName: [String], appearances: Int, position: Int) {
        
        self.word = word
        self.documentsName = documentsName
        self.appearances = appearances
        self.position = position
        
        super.init(cellType: .description)
    }
    
}
