//
//  PlaylistTableViewController.swift
//  PlaylistCoreData
//
//  Created by Michael Moore on 8/7/19.
//  Copyright © 2019 Michael Moore. All rights reserved.
//

import UIKit

class PlaylistTableViewController: UITableViewController {
    @IBOutlet weak var playlistTextField: UITextField!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        tableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func addPlaylistButtonTapped(_ sender: Any) {
        guard let playlistName = playlistTextField.text else {return}
        
        PlaylistController.shared.createPlaylist(with: playlistName)
        
        playlistTextField.text = ""
        tableView.reloadData()
        
    }
    // MARK: - Table view data source


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return PlaylistController.shared.playlists.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "playlistCell", for: indexPath)
        
        let playlist = PlaylistController.shared.playlists[indexPath.row]
        
        let songCount = playlist.songs?.count ?? 0
        
        cell.textLabel?.text = playlist.playlistName
        cell.detailTextLabel?.text = "\(songCount)"

        return cell
    }
    

   
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let playlist = PlaylistController.shared.playlists[indexPath.row]
            PlaylistController.shared.delete(playlist: playlist)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    // MARK: - Navigation

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // IIDOO
        
        if segue.identifier == "toSongTVC" {
            guard let index = tableView.indexPathForSelectedRow,
               let destinationVC = segue.destination as? SongTableViewController else { return }
            
            let playlist = PlaylistController.shared.playlists[index.row]
            
            destinationVC.playlist = playlist
        }
    }
}
