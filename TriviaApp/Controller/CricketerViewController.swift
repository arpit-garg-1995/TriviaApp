//
//  CricketerViewController.swift
//  TriviaApp
//
//  Created by Arpit Garg on 18/12/20.
//  Copyright © 2020 Arpit Garg. All rights reserved.
//

import UIKit

class CricketerViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    private let options = ["A) Sachin Tendulkar", "B) Virat Kolli", "C) Adam Gilchirst", "D) Jacques Kallis"]
    private var selectedCellPos:Int?
    private var model:GameModel?
    
        
        override func viewDidLoad() {
            super.viewDidLoad()
            tableView.dataSource = self
            tableView.delegate = self
        }
        
    @IBAction func nextAction(_ sender: UIButton) {
        if let pos = selectedCellPos{
            model?.cricketer = options[pos]
            if let storyboard = self.storyboard,let secondViewController = storyboard.instantiateViewController(identifier: "ColorsViewController") as? ColorsViewController, let navigation = self.navigationController{
                secondViewController.passsStruct(model: model!); //passStruct
                navigation.pushViewController(secondViewController, animated: true)
            }
        }else{
            showAlert()
        }
    }
    
    private func showAlert(){
        let alert = UIAlertController(title: "Error", message: "Select atleast one option", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    func passsStruct(model:GameModel){
        self.model = model
    }
    
    
        
}


extension CricketerViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return options.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "Cell") //standardCell
        cell.textLabel!.text = options[indexPath.row]
        cell.selectionStyle = .none
        return cell
    }
    
    
}


extension CricketerViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath){
            if cell.accessoryType == .checkmark{
                cell.accessoryType = .none
                selectedCellPos = nil
            }else{
                cell.accessoryType = .checkmark
                selectedCellPos = indexPath.row
            }
        }
    }

    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        tableView.cellForRow(at: indexPath)?.accessoryType = .none
    }
}

