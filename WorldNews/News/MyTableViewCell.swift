//
//  MyTableViewCell.swift
//  News
//
//  Created by Kresimir Ivanjko on 17.04.2023..
//

import UIKit

class MyTableViewCell: UITableViewCell {

   
    @IBOutlet var myImageView: UIImageView!
    @IBOutlet var myNewsTitle: UILabel!
    @IBOutlet var myDate: UILabel!
    @IBOutlet var myAuthor: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
 
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    override func prepareForReuse() {
        super.prepareForReuse()
        myImageView.image = nil
    }

}
