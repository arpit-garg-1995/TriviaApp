//
//  SummaryViewController.swift
//  TriviaApp
//
//  Created by Arpit Garg on 18/12/20.
//  Copyright © 2020 Arpit Garg. All rights reserved.
//

import UIKit

class SummaryViewController: UIViewController {

    @IBOutlet weak var q1: UILabel!
    @IBOutlet weak var a1: UILabel!
    @IBOutlet weak var q2: UILabel!
    @IBOutlet weak var a2: UILabel!
    @IBOutlet weak var q3: UILabel!
    @IBOutlet weak var a3: UILabel!
    
    private var model:GameModel?
    
    func passModel(_ model:GameModel){
        self.model = model
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let mod = model{
            q1.text = "Hello \"\(mod.name!)\""
            a2.text = "Answer: \"\(mod.cricketer!)\""
            var val:String = mod.colors![0]
            if mod.colors!.count>1{
                for i in 1..<mod.colors!.count{
                    val = val + ", " + mod.colors![i]
                }
            }
            a3.text = "Answers: \"\(val)\""
        }
    }
    

    @IBAction func finsih(_ sender: UIButton) {
        self.navigationController!.popToRootViewController(animated: true)
    }
    
}
