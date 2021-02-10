//
//  ResultsViewController.swift
//  PersonalQuiz
//
//  Created by Alexey Efimov on 08.02.2021.
//

import UIKit

class ResultsViewController: UIViewController {
    
    // MARK: - Public properties
    var aply: [Answer] = []
    
    @IBOutlet var resultAnswersLabel: UILabel!
    
    @IBOutlet var resualtDefinitionLable: UILabel!
}

    // MARK: UIViewController Method
    extension ResultsViewController {
        override func viewDidLoad() {
        super.viewDidLoad()

            navigationItem.hidesBackButton = true
            updateResult ()
    }

}

// MARK: - Update UI
    extension ResultsViewController {
        private func updateResult() {
            var oldOfAnimals: [AnimalType: Int] = [:]
            let animals =  aply.map {$0.type}
            
            for animal in animals {
                oldOfAnimals[animal] = (oldOfAnimals[animal] ?? 0) + 1
            }
             
            let sortedOldOfAnimals = oldOfAnimals.sorted { $0.value > $1.value }
            guard let mostOldOfAnimals = sortedOldOfAnimals.first?.key else { return }
            
            updateUI(with: mostOldOfAnimals)
        }
        
        private func updateUI(with animal: AnimalType) {
            resultAnswersLabel.text = "Вы - \(animal.rawValue)!"
            resualtDefinitionLable.text = "\(animal.definition)"
        }
            
        }
    
