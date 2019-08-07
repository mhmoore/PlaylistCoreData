//
//  Song+Convenience.swift
//  PlaylistCoreData
//
//  Created by Michael Moore on 8/7/19.
//  Copyright © 2019 Michael Moore. All rights reserved.
//

import Foundation
import CoreData

extension Song {
    
    @discardableResult // IDK WHY, BUT KARL SAID TO
    convenience init(trackTitle: String, artist: String, playlist: Playlist, moc: NSManagedObjectContext = CoreDataStack.context) {
        self.init(context: moc)
        
        self.trackTitle = trackTitle
        self.artist = artist
        self.playlist = playlist
    }
}
