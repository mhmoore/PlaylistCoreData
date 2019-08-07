//
//  SongController.swift
//  PlaylistCoreData
//
//  Created by Michael Moore on 8/7/19.
//  Copyright © 2019 Michael Moore. All rights reserved.
//

import Foundation
import CoreData

class SongController {
    
    static func createSongWith(trackTitle: String, artist: String, playlist: Playlist) {
        Song(trackTitle: trackTitle, artist: artist, playlist: playlist)
    
        PlaylistController.shared.saveToPeristentStore()
    }
    
    static func delete(song: Song) {
        CoreDataStack.context.delete(song)
        
        PlaylistController.shared.saveToPeristentStore()
    }
}
