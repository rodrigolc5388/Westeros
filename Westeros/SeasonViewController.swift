//
//  SeasonViewController.swift
//  Westeros
//
//  Created by Rodrigo Limpias Cossio on 23/8/17.
//  Copyright © 2017 Rodrigo Limpias Cossío. All rights reserved.
//

import UIKit

class SeasonViewController: UIViewController {

    @IBOutlet weak var seasonDateView: UILabel!
    @IBOutlet weak var seasonImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    let model: Season
    
    init(model: Season){
        self.model = model
        super.init(nibName: nil, bundle: nil)
        self.title = model.seasonName
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI(){
        
        let episodes = UIBarButtonItem(title: "Episodes",
                                       style: .plain,
                                       target: self,
                                       action: #selector(displayEpisodes))
        
        navigationItem.rightBarButtonItem = episodes
    }
    
    @objc func displayEpisodes(){
        
        let episodesViewC = EpisodesTableViewController(model: model._episodes.sorted())
        navigationController?.pushViewController(episodesViewC, animated: true)
    }
    
    func syncViewWithModel(){
        seasonDateView.text = "Release date: \(model.releaseDate.dateToString())"
        seasonImageView.image = model.image
    }
    
    override func viewWillAppear(_ animated: Bool){
        super.viewWillAppear(animated)
        
        setupUI()
        syncViewWithModel()
    }
    
    

    


}
