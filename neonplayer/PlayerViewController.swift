//
//  PlayerViewController.swift
//  neonplayer
//
//  Created by Sergio on 7/21/16.
//  Copyright © 2016 Cayugasoft. All rights reserved.
//

import UIKit

final class PlayerViewController: UIViewController {
    
    @IBOutlet weak var playerScreen: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        playerScreen.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(coverImageDidTap)))
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func coverImageDidTap() {
        performSegue(withIdentifier: "toSongsQueueSegue", sender: self)
    }

}

