//
//  OperatorsViewController.swift
//  Final1
//
//  Created by Abhinav R. Pappu 2019 on 12/12/18.
//  Copyright © 2018 Abhinav Pappu. All rights reserved.
//

import UIKit

class OperatorsViewController: UIViewController {
    @IBOutlet weak var expressionLabel: UILabel!
    
    var queue = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        expressionLabel.text = queue
    }
    
    @IBAction func operatorClicked(_ sender: UIButton) {
        if (sender.currentTitle! == "=") {
            
        } else {
            let newQueue = queue + sender.currentTitle!
            let vc = storyboard?.instantiateViewController(withIdentifier: "numbers") as! NumbersViewController
            vc.queue = newQueue
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
