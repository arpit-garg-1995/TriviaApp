//
//  ColorsViewController.swift
//  TriviaApp
//
//  Created by Arpit Garg on 18/12/20.
//  Copyright © 2020 Arpit Garg. All rights reserved.
//

import UIKit

class ColorsViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    private let colors = ["A) White", "B) Yellow", "C) Orange", "D) Green"]
    private let colorsString = ["White", "Yellow", "Orange", "Green"]
    private var positions = [Int]()
    private var model:GameModel?
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
    }
    

    @IBAction func nextAct(_ sender: UIButton) {
        if (positions.count > 0){
            var cols = [String]()
            for i in 0..<positions.count{
               cols.append(colorsString[positions[i]])
            }
            model?.colors = cols
            if let delegate = UIApplication.shared.delegate as? AppDelegate, let model = self.model{
                let currentDateTime = Date()

                // initialize the date formatter and set the style
                let formatter = DateFormatter()
                formatter.timeStyle = .medium
                formatter.dateStyle = .long

                // get the date time String from the date object
                let string = formatter.string(from: currentDateTime)
               
                delegate.saveModel(model.id, model.name!, model.cricketer!, string, cols)
                if let storyboard = self.storyboard,let secondViewController = storyboard.instantiateViewController(identifier: "SummaryViewController") as? SummaryViewController, let navigation = self.navigationController{
                    secondViewController.passModel(model); //passStruct
                    navigation.pushViewController(secondViewController, animated: true)
                }
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

extension ColorsViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return colors.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "Cell") //standard Cell
        cell.textLabel!.text = colors[indexPath.row] //standard properties
        cell.selectionStyle = .none
        return cell
    }
    
    
}


extension ColorsViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath){
            if cell.accessoryType == .checkmark{
                cell.accessoryType = .none
                positions = positions.filter {$0 != indexPath.row}
            }else{
                cell.accessoryType = .checkmark
                positions.append(indexPath.row)
            }
        }
    }
}
