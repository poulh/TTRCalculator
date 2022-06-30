//
//  ViewController.swift
//  TTRCalculator
//
//  Created by Poul Hornsleth on 6/25/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var pointsLabel: UILabel!
    @IBOutlet weak var trainCarLabel: UILabel!
    
    @IBOutlet var trainButtonCollection: [UIButton]!
    
    var total = 0
    var count = 0
    
    var trainValues : [(Int, Int)] = [(Int, Int)](repeating: ( 0,0), count: 8)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        clearAll()
        updateAll()
    }

    func clearAll() {
        total = 0
        count = 0
        trainValues = [(1,0),
                    (2,0),
                    (4,0),
                    (7,0),
                    (10,0),
                    (15,0),
                    (18,0),
                    (21,0)
        ]
        
        for (trainIndex, button) in trainButtonCollection.enumerated() {
            let subtext = "\(trainValues[trainIndex].1) x \(trainValues[trainIndex].0) = \(trainValues[trainIndex].1 * trainValues[trainIndex].0)"

            button.configuration?.subtitle = subtext
        }
    }
    
    func updateAll() {
        pointsLabel.text = String(total)
        trainCarLabel.text = String(count)
    }
    
    @IBAction func trainButtonPressed(_ sender: UIButton) {
        
        if let title = sender.titleLabel?.text {
            if let trainLength = Int(title) {

                let trainIndex = trainLength - 1

                total += trainValues[trainIndex ].0
                count += trainLength
                trainValues[trainIndex].1 += 1
                
                let subtext = "\(trainValues[trainIndex].1) x \(trainValues[trainIndex].0) = \(trainValues[trainIndex].1 * trainValues[trainIndex].0)"
                
                sender.configuration?.subtitle = subtext
                
                updateAll()
            }
        }
    }
    
    @IBAction func clearButtonPressed(_ sender: Any) {
        clearAll()
        updateAll()
    }
    
}

