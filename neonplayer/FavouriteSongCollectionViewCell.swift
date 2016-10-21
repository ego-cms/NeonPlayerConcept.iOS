//
//  FavouriteSongCollectionViewCell.swift
//  neonplayer
//
//  Created by Sergio on 8/2/16.
//  Copyright © 2016 Cayugasoft. All rights reserved.
//

import UIKit

protocol FavouriteSongDelegate {
    func addToQueue(_ cell: FavouriteSongCollectionViewCell)
}

final class FavouriteSongCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var artist: UILabel!
    @IBOutlet weak var cover: UIImageView!
    
    var delegate: FavouriteSongDelegate?
    
    @IBAction func addButtonDidTap(_ sender: AnyObject) {
        delegate?.addToQueue(self)
    }
}
