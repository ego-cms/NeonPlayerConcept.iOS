//
//  SongsQueueViewController.swift
//  neonplayer
//
//  Created by Sergio on 7/22/16.
//  Copyright © 2016 Cayugasoft. All rights reserved.
//

import UIKit

final class SongsQueueViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UICollectionViewDelegate, UICollectionViewDataSource, FavouriteSongDelegate {
    
    // MARK: - Constants
    
    let songsQueueCellHeight: CGFloat = 56
    
    // MARK: - IBOutlets

    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var subContentView: UIView!
    @IBOutlet weak var subContentViewClipped: UIView!
    
    @IBOutlet weak var backgroundView: UIView!
    @IBOutlet weak var playingSongCoverImageView: UIImageView!
    @IBOutlet weak var songTitle: UILabel!
    @IBOutlet weak var songArtist: UILabel!
    @IBOutlet weak var progressView: UIProgressView!
    
    @IBOutlet weak var songsQueueView: UIView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var maskView: UIView!
    
    @IBOutlet weak var favouriteSongsCollectionView: UICollectionView!
    @IBOutlet weak var footerView: UIView!
    
    // MARK: - DataSource
    
    var songsQueue = DataSource().songsQueue
    var favouriteSongs = DataSource().favouriteSongs
    
    // MARK: - ViewController Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.isEditing = true
    }

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        // Make cornered borders for the background view (which is white by default)
        backgroundView.layer.cornerRadius = 4
        
        // Add shadow to the cover of playing song
        playingSongCoverImageView.layer.masksToBounds = false
        playingSongCoverImageView.layer.shadowOffset = CGSize(width: 1.0, height: 0.0)
        playingSongCoverImageView.layer.shadowRadius = 5
        playingSongCoverImageView.layer.shadowOpacity = 0.5
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        let collectionWidth = view.frame.width - 50
        var collectionViewItemSize = (favouriteSongsCollectionView.collectionViewLayout as! UICollectionViewFlowLayout).itemSize
        collectionViewItemSize.width = collectionWidth
        collectionViewItemSize.height = 44
        (favouriteSongsCollectionView.collectionViewLayout as! UICollectionViewFlowLayout).itemSize = collectionViewItemSize
        favouriteSongsCollectionView.decelerationRate = UIScrollViewDecelerationRateFast;
    }
    
    // MARK: - Button handlers
    
    @IBAction func closeButtonDidTap(_ sender: AnyObject) {
        dismiss(animated: true) { 
            //
        }
    }
    
    // MARK: - TableView DataSource&Delegate methods
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return tableView.dequeueReusableCell(withIdentifier: "cell") as! SongQueueTableViewCell
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        guard let cell = cell as? SongQueueTableViewCell else {
            return
        }
        
        cell.title.text = songsQueue[(indexPath as NSIndexPath).row].title
        cell.artist.text = songsQueue[(indexPath as NSIndexPath).row].artist
        cell.cover.image = UIImage(named: songsQueue[(indexPath as NSIndexPath).row].coverImageName)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return songsQueue.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return songsQueueCellHeight
    }
    
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        // Here you can put your code to reorder tableView source objects
    }
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCellEditingStyle {
        return .none
    }
    
    func tableView(_ tableView: UITableView, shouldIndentWhileEditingRowAt indexPath: IndexPath) -> Bool {
        return false
    }
    
    // MARK: - UICollectionView DataSource&Delegate methods
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return favouriteSongs.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return collectionView.dequeueReusableCell(withReuseIdentifier: "item", for: indexPath)
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        guard let cell = cell as? FavouriteSongCollectionViewCell else {
            return
        }
        
        cell.title.text = favouriteSongs[(indexPath as NSIndexPath).row].title
        cell.artist.text = favouriteSongs[(indexPath as NSIndexPath).row].artist
        cell.cover.image = UIImage(named: favouriteSongs[(indexPath as NSIndexPath).row].coverImageName)
        cell.tag = (indexPath as NSIndexPath).row
        cell.delegate = self
    }
    
    // MARK: - FavouriteSongDelegate methods
    
    func addToQueue(_ cell: FavouriteSongCollectionViewCell) {
        guard let favoriteCellIndexPath = self.favouriteSongsCollectionView.indexPath(for: cell) else {
            return
        }
        
        let song = self.favouriteSongs[(favoriteCellIndexPath as NSIndexPath).row]
        songsQueue.insert(song, at: 0)
        favouriteSongs.remove(at: (favoriteCellIndexPath as NSIndexPath).row)
        favouriteSongsCollectionView.deleteItems(at: [favoriteCellIndexPath])
        
        if firstRowVisible() {
            tableView.reloadData()
            performAnimation()
        } else {
            tableView.beginUpdates()
            tableView.insertRows(at: [IndexPath(row: 0, section: 0)], with: .bottom)
            tableView.endUpdates()
        }
    }
        
    func performAnimation() {
        var cellsToMove = [UITableViewCell]()
        var otherCells = self.tableView.visibleCells
        
        for i in (0..<3) {
            guard (self.tableView.cellForRow(at: IndexPath(row: i, section: 0)) != nil) else {
                break
            }
            
            cellsToMove.append(self.tableView.cellForRow(at: IndexPath(row: i, section: 0))!)
            otherCells.remove(at: 0)
        }
        
        guard cellsToMove.count > 0 else {
            return
        }

        for cell in self.tableView.visibleCells {
            cell.center.y -= cell.frame.height
        }
        
        UIView.animate(withDuration: 0.56,
            delay: 0,
            usingSpringWithDamping: 0.5,
            initialSpringVelocity: 15,
            options: [],
            animations: {
                for cell in cellsToMove {
                    cell.center.y += cell.frame.height
                }
            },
            completion: nil)
        
        UIView.animate(withDuration: 0.24, animations: {
            for cell in otherCells {
                cell.center.y += cell.frame.height
            }
        }) 
        
    }
    
    func firstRowVisible() -> Bool {
        return tableView.cellForRow(at: IndexPath(row: 0, section: 0)) != nil
    }
}


extension SongQueueTableViewCell {
    func fillWithSong(_ song: Song) {
        title.text = song.title
        artist.text = song.artist
        cover.image = UIImage(named: "\(song.coverImageName)")
    }
}


extension IndexPath {
    static func fromTuple(_ tuple: (Int, Int)) -> IndexPath {
        return IndexPath(row: tuple.0, section: tuple.1)
    }
}
