//
//  UploadDocumentsViewModel.swift
//  prueba
//
//  Created by Leisure on 06/05/2021.
//

import UIKit

class UploadDocumentsViewModel {

    var manager: WordSearcherManager?
    
    func getTitleText()-> String {
        return "Selección de archivos"
    }
    
    func getDescriptionText()-> String {
        return "Pulsa el botón y adjunta tantos documentos como desees."
    }
    
    func getUploadBtnTitle()-> String {
        return "Adjuntar documentos"
    }
    
    func getContinueBtnTitle()-> String {
        return "Ver resultados"
    }
    
    func getStackViewTitle()-> String {
        return "Documentos seleccionados"
    }
    
    func processDocumentsSelected(documentText: String, documentName: String) {
        manager?.processDocumentText(documentText: documentText, documentName: documentName)
    }
    
}
