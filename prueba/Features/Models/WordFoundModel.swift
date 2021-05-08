//
//  WordFoundModel.swift
//  prueba
//
//  Created by Leisure on 06/05/2021.
//

import UIKit

class WordFoundModel {

    var word: String
    var documentNames: [String]
    var position: Int
    var counter: Int = 1
    
    init(word: String, documentName: String, position: Int) {
        self.word = word
        self.documentNames = [documentName]
        self.position = position
    }
    
    func addDocument(withName docName: String) {
        documentNames.append(docName)
    }
    
    func updateCounter() {
        self.counter += 1
    }
    
}
