//
//  HouseViewController.swift
//  Westeros
//
//  Created by Rodrigo Limpias Cossio on 18/7/17.
//  Copyright © 2017 Rodrigo Limpias Cossío. All rights reserved.
//

import UIKit

class HouseViewController: UIViewController {

    @IBOutlet weak var houseNameView: UILabel!
    
    @IBOutlet weak var wordsTextView: UILabel!
    
    @IBOutlet weak var sigilImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    let model: House
    
    init(model: House){
        self.model = model
        super.init(nibName: nil, bundle: nil)
        self.title = model.name
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI(){
        //Creamos un botón a la barra del navigationController
        let wiki = UIBarButtonItem(title: "Wiki",
                                   style: .plain,
                                   target: self,
                                   action: #selector(displayWiki))
        
        let members = UIBarButtonItem(title: "Members",
                                     style: .plain,
                                     target: self,
                                     action: #selector(displayMembers))
        
        // Añadimos
        navigationItem.rightBarButtonItems = [wiki, members]
        
    }
    
    @objc func displayWiki(){
        
        // Creamos un WikiVC
        let wikiVC = WikiViewController(model: model)
        
        // Lo cargamos en el navigation
        navigationController?.pushViewController(wikiVC, animated: true)
    }
    
    @objc func displayMembers(){
        let membersVC = MembersTableViewController(model: model.sortedMembers())
        navigationController?.pushViewController(membersVC, animated: true)
    }
    
    func syncViewWithModel(){
        //model -> view
        houseNameView.text = "House \(model.name)"
        sigilImage.image = model.sigil.image
        wordsTextView.text = model.words
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        setupUI()
        
        syncViewWithModel()
    }
}
