//
//  WordFoundHeaderTableViewCell.swift
//  prueba
//
//  Created by Leisure on 09/05/2021.
//

import UIKit

class WordFoundHeaderTableViewCell: UITableViewCell {

    @IBOutlet weak var wordHeaderLabel: UILabel!
    @IBOutlet weak var documentHeaderLabel: UILabel!
    @IBOutlet weak var appearancesHeaderLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func configureCell(withModel model: WordFoundHeaderCellModel) {
        
        wordHeaderLabel.text = "Palabra"
        
        documentHeaderLabel.text = "Documento"
        
        appearancesHeaderLabel.text = "Apariciones"
        
    }
    
}
