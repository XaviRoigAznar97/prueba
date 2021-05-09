//
//  WordFoundDescriptionTableViewCell.swift
//  prueba
//
//  Created by Leisure on 08/05/2021.
//

import UIKit

class WordFoundDescriptionTableViewCell: UITableViewCell {

    @IBOutlet weak var wordLabel: UILabel!
    @IBOutlet weak var documentsLabel: UILabel!
    @IBOutlet weak var appearancesLabel: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func configureCell(withModel model: WordFoundDescriptionCellModel) {
        
        wordLabel.text = model.word
        
        documentsLabel.text = concatenateDocumentsName(documentsName: model.documentsName)
        
        appearancesLabel.text = model.appearances.description
        
    }
    
    private func concatenateDocumentsName(documentsName: [String])-> String {
        
        var names = ""
        
        for (i, name) in documentsName.enumerated() {
            
            if i < documentsName.count - 1 {
                
                names += "\(name)\n\n"
                
            } else {
                
                names += name
                
            }
            
        }
        
        return names
    }
}
