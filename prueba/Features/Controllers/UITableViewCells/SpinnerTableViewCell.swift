//
//  SpinnerTableViewCell.swift
//  prueba
//
//  Created by Leisure on 09/05/2021.
//

import UIKit

class SpinnerTableViewCell: UITableViewCell {

    var spinner: UIActivityIndicatorView?


    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        selectionStyle = .none
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        addSpinner()
    }
    
    fileprivate func addSpinner(){

        spinner?.removeFromSuperview()

        spinner = UIActivityIndicatorView(style: .medium)

        spinner?.frame = CGRect(x: CGFloat(0), y: CGFloat(0), width: CGFloat(200), height: CGFloat(44))
        
    }
    
    fileprivate func removeSpinner(){

        spinner?.removeFromSuperview()

    }

    override func willMove(toSuperview newSuperview: UIView?) {

        super.willMove(toSuperview: newSuperview)

        if newSuperview == nil {

            self.stopSpinner()

        }

        else {

            self.startSpinner()

        }

    }

    

    func startSpinner(){

        spinner?.startAnimating()

    }

    

    func stopSpinner(){

        spinner?.stopAnimating()

    }
}
