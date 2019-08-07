//
//  PlaylistController.swift
//  PlaylistCoreData
//
//  Created by Michael Moore on 8/7/19.
//  Copyright © 2019 Michael Moore. All rights reserved.
//

import Foundation
import CoreData

class PlaylistController {
    
    static let shared = PlaylistController()
    
    // local SoT
    var playlists: [Playlist] {
        
        let fetchRequest: NSFetchRequest<Playlist> = Playlist.fetchRequest()
        
        return (try? CoreDataStack.context.fetch(fetchRequest)) ?? []
        }
    
    func createPlaylist(with name: String) {
        // _ means IDGAFOS
        let _ = Playlist(playlistName: name)
        
        saveToPeristentStore()
    }
    
    func delete(playlist: Playlist) {
        CoreDataStack.context.delete(playlist)
        
        saveToPeristentStore()
    }
    
    func saveToPeristentStore() {
        do {
            try CoreDataStack.context.save()
        } catch {
            print("There was an error saving the Objects in \(#function): \(error.localizedDescription)")
        }
    }
    
    
    
    
    
} // End of class
