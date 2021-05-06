//
//  LandingViewModel.swift
//  prueba
//
//  Created by Leisure on 06/05/2021.
//

import UIKit

class LandingViewModel: NSObject {

    func getButtonTitle()-> String {
        return "Empezar"
    }
    
    func getTitleLabelText()-> String {
        return "Esta aplicación le permite cargar tantos documentos como usted desee.\n\nUna vez tenga los documentos cargados, podrá visualizar el número de veces que aparece cada palabra en total y en cada documento. También podrá ordenarlas alfabéticamente, por posición y por número de aparaciones.\n\nPulse sobre el botón empezar, podrá disfrutar de las funcionalidades de nuestra App."
    }
}
