//
//  SearchAlbumResultCell.swift
//  LastFM
//
//  Created by Prathap on 27/07/20.
//  Copyright © 2020 Satya Swaroop. All rights reserved.
//

import UIKit

class SearchAlbumResultCell: UITableViewCell {
    
    // MARK: - Property Declarations

    static var identifier = "SearchAlbumResultCell"
    
    // MARK: - UI Declarations
    
    @IBOutlet weak var imageview: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var artist: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
