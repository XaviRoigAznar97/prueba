//
//  WordFoundBaseCellModel.swift
//  prueba
//
//  Created by Leisure on 09/05/2021.
//

import UIKit

enum WordFoundCellType {
    
    case header
    case description
    case loading
    
}

class WordFoundBaseCellModel {

    var cellType: WordFoundCellType
    
    init(cellType: WordFoundCellType) {
        
        self.cellType = cellType
        
    }
    
}
