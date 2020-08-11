//
//  CBSViewController.swift
//  DeckOfOneCardOBJC35
//
//  Created by Colton Swapp on 8/11/20.
//  Copyright © 2020 Colton Swapp. All rights reserved.
//

import UIKit

class CBSViewController: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet weak var cardLabel: UILabel!
    @IBOutlet weak var cardImageView: UIImageView!
    
    
    // MARK: - Properties
    
    var card: CBSCard?
    
    override func viewDidLoad() {
        super.viewDidLoad()

       
    }
    
// MARK: - Methods
    @IBAction func drawButtonTapped(_ sender: Any) {
        fetchCards()
    }
    
    func fetchCards() {
        CBSCardController.drawNewCard(1) { (card) in
            if let card = card {
                CBSCardController.fetchCardImage(card[0]) { (image) in
                    DispatchQueue.main.async {
                        if let image = image {
                            self.updateViews(for: card[0], image: image)
                        }
                    }
                }
            }
        }
    }
    
    
    func updateViews(for card: CBSCard, image: UIImage) {
        self.cardLabel.text = card.cardValue
        self.cardImageView.image = image
    }

}

