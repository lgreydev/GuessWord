//
//  ViewController.swift
//  GuessWord
//
//  Created by Sergey Lukaschuk on 17.05.2021.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - Property
    @IBOutlet weak var lifeLabel: UILabel!
    @IBOutlet weak var levelLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var wordLabel: UILabel!
 
    
    // MARK: - ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    
    // MARK: - Action
    @IBAction func pressedButtons(_ sender: UIButton) {
        let letter = sender.titleLabel?.text ?? "no letter"
        print(letter)
    }
}

