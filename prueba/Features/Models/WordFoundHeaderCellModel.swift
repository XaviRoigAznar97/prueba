//
//  WordFoundHeaderCellModel.swift
//  prueba
//
//  Created by Leisure on 09/05/2021.
//

import UIKit

class WordFoundHeaderCellModel {

    var wordTitle: String
    var documentTitle: String
    var appearancesTitle: String
    
    init(wordTitle: String, documentTitle: String, appearancesTitle: String) {
        self.wordTitle = wordTitle
        self.documentTitle = documentTitle
        self.appearancesTitle = appearancesTitle
    }
    
}
