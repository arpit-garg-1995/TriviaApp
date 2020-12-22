//
//  HistoryTableViewController.swift
//  TriviaApp
//
//  Created by Arpit Garg on 18/12/20.
//  Copyright © 2020 Arpit Garg. All rights reserved.
//

import UIKit

class GameCell: UITableViewCell {
    @IBOutlet weak var q1: UILabel!
    @IBOutlet weak var q2: UILabel!
    @IBOutlet weak var q3: UILabel!
    @IBOutlet weak var q4: UILabel!
    
}

class HistoryTableViewController: UITableViewController {
    
    var models:[GamePerson] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        if let delegate = UIApplication.shared.delegate as? AppDelegate{
            models = delegate.getModels()
            self.tableView.reloadData()
        }
    }

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "gameCell", for: indexPath) as! GameCell
        var string = "Answers: "
        let colors = models[indexPath.row].colors!
        print(colors.count)
            for i in 0..<colors.count{
                if i == 0{
                    string = string + colors[i]
                }else{
                    string = string + ", " + colors[i]
                }
            }
            
//        }else{
            cell.q4.text = string
//        }
        cell.q1.text = "GAME 1 : \(models[indexPath.row].date!)"
        cell.q2.text = "Name : \(models[indexPath.row].name!)"
        cell.q3.text = "Answer \(models[indexPath.row].cricketer!)"
        return cell
    }
}

extension String {
    func height(withConstrainedWidth width: CGFloat, font: UIFont) -> CGFloat {
        let constraintRect = CGSize(width: width, height: .greatestFiniteMagnitude)
        let boundingBox = self.boundingRect(with: constraintRect, options: .usesLineFragmentOrigin, attributes: [NSAttributedString.Key.font: font], context: nil)

        return ceil(boundingBox.height)
    }

    func width(withConstrainedHeight height: CGFloat, font: UIFont) -> CGFloat {
        let constraintRect = CGSize(width: .greatestFiniteMagnitude, height: height)
        let boundingBox = self.boundingRect(with: constraintRect, options: .usesLineFragmentOrigin, attributes: [NSAttributedString.Key.font: font], context: nil)

        return ceil(boundingBox.width)
    }
}
