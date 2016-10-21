//
//  DataSource.swift
//  neonplayer
//
//  Created by Sergio on 8/4/16.
//  Copyright © 2016 Cayugasoft. All rights reserved.
//

import Foundation

struct Song {
    var title: String
    var artist: String
    var coverImageName: String
}

struct DataSource {
    
    let songsQueue: [Song] = [
        Song(title: "Boys Boys Boys", artist: "Lady Gaga", coverImageName: "gaga"),
        Song(title: "Roar", artist: "Katy Perry", coverImageName: "kp"),
        Song(title: "Supertrooper", artist: "ABBA", coverImageName: "abba"),
        Song(title: "Genie in a bottle", artist: "Christina Aguilera", coverImageName: "aguilera1"),
        Song(title: "J'en ai marre!", artist: "Alizee", coverImageName: "alizee3"),
        Song(title: "Treasure", artist: "Bruno Mars", coverImageName: "bm1"),
        Song(title: "Oops... I did it again!", artist: "Britney Spears", coverImageName: "britney1"),
        Song(title: "Boom Boom Pow", artist: "Black Eyed Peas", coverImageName: "byp"),
        Song(title: "Clubbers Collection", artist: "EDM", coverImageName: "edm"),
        Song(title: "Fergalicious", artist: "Fergie", coverImageName: "fergie"),
    ]
    
    let favouriteSongs: [Song] = [
        Song(title: "Gentleman", artist: "Psy", coverImageName: "psy1"),
        Song(title: "Perfect Geometry", artist: "Keane", coverImageName: "keane"),
        Song(title: "Hidden Pictures", artist: "Choosing Sides", coverImageName: "hp"),
        Song(title: "Main Theme", artist: "Grand Theft Auto V", coverImageName: "gta"),
        Song(title: "Candyman", artist: "Christina Aguilera", coverImageName: "aguilera2"),
        Song(title: "La Isla Bonita", artist: "Alizee", coverImageName: "alizee2"),
        Song(title: "Dance Monkey", artist: "Psy", coverImageName: "psy3"),
        Song(title: "Grenade", artist: "Bruno Mars", coverImageName: "bm2"),
        Song(title: "The Way I Are", artist: "Timbaland", coverImageName: "tbland2"),
        Song(title: "Womanizer", artist: "Britney Spears", coverImageName: "britney3"),
        Song(title: "My Humps", artist: "Black Eyed Peas", coverImageName: "byp1"),
        Song(title: "Uptown Funk", artist: "Bruno Mars", coverImageName: "bm3"),
        Song(title: "SexyBack", artist: "Justin Timberlake", coverImageName: "tbl1"),
        Song(title: "Toxic", artist: "Britney Spears", coverImageName: "britney2"),
        Song(title: "Gangnam Style", artist: "Psy", coverImageName: "psy2"),
        Song(title: "Young Girls", artist: "Bruno Mars", coverImageName: "bm4"),
        Song(title: "Shake It Off", artist: "Tailor Swift", coverImageName: "swift"),
        Song(title: "Give It To Me", artist: "Timbaland", coverImageName: "tbland"),
        Song(title: "Gimme Gimme More", artist: "Britney Spears", coverImageName: "britney4"),
        Song(title: "Marry You", artist: "Bruno Mars", coverImageName: "bm5"),
        Song(title: "Cry Me a River", artist: "Justin Timberlake", coverImageName: "tbl2"),
        Song(title: "Hey! Amigo!", artist: "Alizee", coverImageName: "alizee1"),
    ]
    
}
