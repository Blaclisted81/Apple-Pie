//
//  ViewController.swift
//  Apple Pie
//
//  Created by David Houghton on 14/7/21.
//

import UIKit

class ViewController: UIViewController {

    
    //MARK - Outlets
    
    @IBOutlet weak var treeImageView: UIImageView!
    @IBOutlet weak var correctWordLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    
    @IBOutlet var letterButtons: [UIButton]!
    
    
    @IBAction func letterButtonPressed(_ sender: UIButton) {
        sender.isEnabled = false
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

