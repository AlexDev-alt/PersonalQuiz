//
//  ResultsViewController.swift
//  PersonalQuiz
//
//  Created by Alexey Efimov on 11.02.2020.
//  Copyright © 2020 Alexey Efimov. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {
    
    
    // MARK: - IB Outlets
    @IBOutlet var resultLabel: UILabel!
    @IBOutlet var resultDiscription: UILabel!
    
    // MARK: - Public Methods
    var answers: [Answer] = []
    
    // MARK: - Private properties
    private var animalPoint = ["Dog": 0, "Cat": 0, "Rabbit": 0, "Turtle": 0]
    private let magickNumber = 10
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.hidesBackButton = true
        chooseType()
       
    }
    
    // MARK: - Private Methods
    private func countOfYoureType() {
        
        let firstAnimal = answers.first
        
        if  firstAnimal?.type == .dog {
            animalPoint["Dog"]! += magickNumber
        } else if firstAnimal?.type == .cat {
            animalPoint["Cat"]! += magickNumber
        } else if firstAnimal?.type == .rabbit {
            animalPoint["Rabbit"]! += magickNumber
        } else if  firstAnimal?.type == .turtle {
            animalPoint["Turtle"]! += magickNumber
        }
        
        answers.forEach { answer in
            switch answer.type {
            case .dog:
                animalPoint["Dog"]! += 1
            case .cat:
                animalPoint["Cat"]! += 1
            case .rabbit:
                animalPoint["Rabbit"]! += 1
            case .turtle:
                animalPoint["Turtle"]! += 1
            }
        }
        
    }
    
    private func chooseType() {
        
        countOfYoureType()
        
        if animalPoint["Dog"]! >= magickNumber {
            resultLabel.text = String(AnimalType.dog.rawValue)
            resultDiscription.text = AnimalType.dog.difinition
        } else if animalPoint["Cat"]! >= magickNumber {
            resultLabel.text = String(AnimalType.cat.rawValue)
            resultDiscription.text = AnimalType.cat.difinition
        }  else if animalPoint["Rabbit"]! >= magickNumber {
            resultLabel.text = String(AnimalType.rabbit.rawValue)
            resultDiscription.text = AnimalType.rabbit.difinition
        } else if animalPoint["Turtle"]! >= magickNumber {
            resultLabel.text = String(AnimalType.turtle.rawValue)
            resultDiscription.text = AnimalType.turtle.difinition
        }
        
    }
    
    deinit {
        print("ResultsViewController was been dealocated")
    }
    
}

