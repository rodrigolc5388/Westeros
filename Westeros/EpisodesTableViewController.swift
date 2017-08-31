//
//  EpisodesTableViewController.swift
//  Westeros
//
//  Created by Rodrigo Limpias Cossio on 30/8/17.
//  Copyright © 2017 Rodrigo Limpias Cossío. All rights reserved.
//

import UIKit

class EpisodesTableViewController: UITableViewController {
        
    let model: [Episode]
    
    init(model: [Episode]){
        self.model = model
        super.init(nibName: nil, bundle: nil)
        title = "Episodes"
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cellID = "EpisodeCell"
        
        let episode = model[indexPath.row]
            var cell = tableView.dequeueReusableCell(withIdentifier: cellID)
        
        if cell == nil {
            cell = UITableViewCell(style: .default, reuseIdentifier: cellID)
        }
        
        cell?.textLabel?.text = episode.title

        return cell!
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let episode = model[indexPath.row]
        
        let episodeVC = EpisodeViewController(model: episode)
        navigationController?.pushViewController(episodeVC, animated: true)
    }
    
}
