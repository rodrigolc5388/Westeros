//
//  EpisodeViewController.swift
//  Westeros
//
//  Created by Rodrigo Limpias Cossio on 30/8/17.
//  Copyright © 2017 Rodrigo Limpias Cossío. All rights reserved.
//

import UIKit

class EpisodeViewController: UIViewController {
    
    @IBOutlet weak var episodeTitleView: UILabel!
    @IBOutlet weak var episodeDateView: UILabel!
    
    let model: Episode
    
    init(model: Episode){
        self.model = model
        super.init(nibName: nil, bundle: nil)
        title = model.title
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func syncViewWithModel(){
        
        episodeTitleView.text = "Title: \(model.title)"
        episodeDateView.text = "Emission Date: \(model.emissionDate.dateToString())"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        syncViewWithModel()
    }

    
}
