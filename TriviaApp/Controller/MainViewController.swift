//
//  MainViewController.swift
//  TriviaApp
//
//  Created by Arpit Garg on 18/12/20.
//  Copyright © 2020 Arpit Garg. All rights reserved.
//

import UIKit
import CoreData

class MainViewController: UIViewController {
    
    var model:GameModel?

    @IBOutlet weak var nameTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        model = GameModel(id: UUID().uuidString)
    }
    
    @IBAction func nextAction(_ sender: UIButton) {
        if let text = nameTextField.text, !text.isEmpty{
            model!.name = text
            nameTextField.text?.removeAll()
            if let storyboard = self.storyboard,let secondViewController = storyboard.instantiateViewController(identifier: "CricketerViewController") as? CricketerViewController, let navigation = self.navigationController{
                secondViewController.passsStruct(model: model!); //passStruct
                navigation.pushViewController(secondViewController, animated: true)
            }
        }else{
            showAlert()
        }
    }
    
    
    private func showAlert(){
        let alert = UIAlertController(title: "Error", message: "Empty Name", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    @IBAction func showHistory(_ sender: UIBarButtonItem) {
        if let storyboard = self.storyboard,let secondViewController = storyboard.instantiateViewController(identifier: "HistoryTableViewController") as? HistoryTableViewController, let navigation = self.navigationController{
            navigation.pushViewController(secondViewController, animated: true)
        }
    }
    
}
