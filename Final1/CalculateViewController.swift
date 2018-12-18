//
//  CalculateViewController.swift
//  Final1
//
//  Created by Abhinav R. Pappu 2019 on 12/18/18.
//  Copyright © 2018 Abhinav Pappu. All rights reserved.
//

import UIKit

class CalculateViewController: UIViewController {
    @IBOutlet weak var resultLabel: UILabel!
    
    var queue = ""

    override func viewDidLoad() {
        super.viewDidLoad()

        resultLabel.text = String?(evaluate())
    }
    
    func evaluate() -> Double? {
        let processedQueue1 = queue.replacingOccurrences(of: "-", with: "+-")
        let terms = processedQueue1.split(separator: "+")
        let terms2 = terms.map({str -> String in str.replacingOccurrences(of: "/", with: "*/")});
        var result = 0.0
        terms2.forEach({ term in
            result += processMultiplication(String(term))
        });
        
        if (!result.isNaN && result.isFinite) {
            return result
        } else {
            let alert = UIAlertController(title: "Error", message: "(Are you dividing by 0?)", preferredStyle: .alert)
            
            let fixAction = UIAlertAction(title: "I'll fix it", style: .default, handler: nil);
            let clearAction = UIAlertAction(title: "Clear", style: .default, handler: {
                action in
                // go back to first view controller
            })
            
            alert.addAction(clearAction)
            alert.addAction(fixAction)
            
            present(alert, animated: true, completion: nil)
        }
        
        return nil
    }
    
    func processMultiplication(_ str: String) -> Double {
        var result = 1.0
        str.split(separator: "*").forEach({term in
            if (term.starts(with: "/")) {
                result /= processPower(String(term.dropFirst()))
            }
            else {
                result *= processPower(String(term))
            }
        });
        return result
    }
    
    func processPower(_ str: String) -> Double {
        let terms = str.split(separator: "^")
        var result = Double(terms[0])!
        for i in 1..<terms.count {
            result = pow(result, Double(terms[i])!)
        }
        return result
    }
}
