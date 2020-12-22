//
//  GameModel.swift
//  TriviaApp
//
//  Created by Arpit Garg on 18/12/20.
//  Copyright © 2020 Arpit Garg. All rights reserved.
//

import Foundation

struct GameModel {
    var id:String
    var name:String?
    var date:String?
    var cricketer:String?
    var colors:[String]?
    
    init(id: String,
         name: String? = nil,
         date: String? = nil, cricketer: String? = nil, colors:[String]? = nil) {
        self.id = id
        self.name = name
        self.date = date
        self.cricketer = cricketer
        self.colors = colors
    }
}
