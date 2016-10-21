//
//  SongsQueueSegue.swift
//  neonplayer
//
//  Created by Sergio on 7/22/16.
//  Copyright © 2016 Cayugasoft. All rights reserved.
//

import UIKit

final class SongsQueueSegue: UIStoryboardSegue {
    
    override func perform() {
        guard let songsQueueVC = destination as? SongsQueueViewController else {
            return
        }
        
        destination.view.alpha = 1.0
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = songsQueueVC.songsQueueView.bounds
        gradientLayer.colors = [UIColor.white.withAlphaComponent(0).cgColor, UIColor.white.cgColor, UIColor.white.cgColor]
        gradientLayer.locations = [0, 0.25, 1]
        songsQueueVC.maskView.layer.insertSublayer(gradientLayer, at: 0)
        
        songsQueueVC.backgroundView.transform = CGAffineTransform(scaleX: 0.5, y: 0.5)
        
        songsQueueVC.playingSongCoverImageView.alpha = 0.4
        songsQueueVC.playingSongCoverImageView.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
        songsQueueVC.playingSongCoverImageView.transform = CGAffineTransform(translationX: 0, y: 6)
        
        songsQueueVC.songTitle.alpha = 0.4
        songsQueueVC.songArtist.alpha = 0.4
        songsQueueVC.songTitle.transform = CGAffineTransform(translationX: 0, y: 6)
        songsQueueVC.songArtist.transform = CGAffineTransform(translationX: 0, y: 6)
        
        songsQueueVC.songsQueueView.transform = CGAffineTransform(translationX: 0, y: songsQueueVC.songsQueueView.bounds.height / 3.0)
        songsQueueVC.maskView.transform = CGAffineTransform(translationX: 0, y: songsQueueVC.songsQueueView.bounds.height / 3.0)
        
        songsQueueVC.progressView.alpha = 0
        songsQueueVC.footerView.alpha = 0
    
        source.view.addSubview(destination.view)
        
        UIView.animate(withDuration: 0.56, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 30, options: UIViewAnimationOptions.curveEaseOut, animations: {
            songsQueueVC.backgroundView.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
        }) { (completed: Bool) in
            //
        }
        
        UIView.animate(withDuration: 0.14, delay: 0, options: .curveLinear, animations: {
            songsQueueVC.playingSongCoverImageView.alpha = 1
            songsQueueVC.playingSongCoverImageView.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
            songsQueueVC.playingSongCoverImageView.transform = CGAffineTransform(translationX: 0, y: 0)
            
            songsQueueVC.songTitle.alpha = 1
            songsQueueVC.songArtist.alpha = 1
            songsQueueVC.songTitle.transform = CGAffineTransform(translationX: 0, y: 0)
            songsQueueVC.songArtist.transform = CGAffineTransform(translationX: 0, y: 0)
        }) { (completed: Bool) in
            //
        }
        
        UIView.animate(withDuration: 0.14, delay: 0.07, options: UIViewAnimationOptions(), animations: {
            songsQueueVC.songTitle.alpha = 1
            songsQueueVC.songArtist.alpha = 1
            songsQueueVC.songTitle.transform = CGAffineTransform(translationX: 0, y: 0)
            songsQueueVC.songArtist.transform = CGAffineTransform(translationX: 0, y: 0)
        }) { (completed: Bool) in
            //
        }
        
        UIView.animate(withDuration: 0.8, delay: 0, options: UIViewAnimationOptions(), animations: {
            songsQueueVC.progressView.alpha = 1
        }) { (completed: Bool) in
            //
        }
        
        UIView.animate(withDuration: 0.14, delay: 0.0, options: .curveEaseOut, animations: {
            songsQueueVC.songsQueueView.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
            songsQueueVC.songsQueueView.transform = CGAffineTransform(translationX: 0, y: 0)
            songsQueueVC.maskView.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
            songsQueueVC.maskView.transform = CGAffineTransform(translationX: 0, y: 20)
        }) { (completed: Bool) in
            //
        }
        
        UIView.animate(withDuration: 0.4, delay: 0.14, options: UIViewAnimationOptions(), animations: {
            songsQueueVC.maskView.transform = CGAffineTransform(translationX: 0, y: songsQueueVC.maskView.frame.size.height)
            songsQueueVC.footerView.alpha = 1
        }, completion: { (completed: Bool) in
            self.destination.modalPresentationStyle = .overCurrentContext
            self.source.present(self.destination, animated: false, completion: { })
        })
    }
    
}
