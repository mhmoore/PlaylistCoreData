//
//  SongTableViewController.swift
//  PlaylistCoreData
//
//  Created by Michael Moore on 8/7/19.
//  Copyright © 2019 Michael Moore. All rights reserved.
//

import UIKit


class SongTableViewController: UITableViewController {
    @IBOutlet weak var trackTitleTextField: UITextField!
    @IBOutlet weak var artistTextField: UITextField!
    
    var playlist: Playlist?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func addButtonTapped(_ sender: Any) {
       guard let songTitle = trackTitleTextField.text,
        let artistName = artistTextField.text,
        let playlist = playlist else {return}
        
        
        SongController.createSongWith(trackTitle: songTitle, artist: artistName, playlist: playlist)
        
        trackTitleTextField.text = ""
        artistTextField.text = ""
        tableView.reloadData()
        
    }
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return playlist?.songs?.count ?? 0
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "songCell", for: indexPath)
        
        guard let unwrappedPlaylist = playlist,
                let song = unwrappedPlaylist.songs?[indexPath.row] as? Song else { return UITableViewCell() }
        
        cell.textLabel?.text = song.trackTitle
        cell.detailTextLabel?.text = song.artist
        

        return cell
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            guard let unwrappedPlaylist = playlist,
                let song = unwrappedPlaylist.songs?[indexPath.row] as? Song else { return }
            
            
            SongController.delete(song: song)
            
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }

}
