//
//  NumbersViewController.swift
//  Final1
//
//  Created by Abhinav R. Pappu 2019 on 12/12/18.
//  Copyright © 2018 Abhinav Pappu. All rights reserved.
//

import UIKit

class NumbersViewController: UIViewController {
    
    @IBOutlet weak var expressionLabel: UILabel!
    
    var queue = ""

    override func viewDidLoad() {
        super.viewDidLoad()

        expressionLabel.text = queue
    }
    
    @IBAction func numberClicked(_ sender: UIButton) {
        if (sender.currentTitle! == "=") {
            
        } else {
            let newQueue = queue + sender.currentTitle!
            let vc = storyboard?.instantiateViewController(withIdentifier: "operators") as! OperatorsViewController
            vc.queue = newQueue
            self.navigationController?.pushViewController(vc, animated: true)
            
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
    }

}
