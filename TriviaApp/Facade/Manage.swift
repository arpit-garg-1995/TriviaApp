//
//  Manage.swift
//  TriviaApp
//
//  Created by Arpit Garg on 18/12/20.
//  Copyright © 2020 Arpit Garg. All rights reserved.
//

import Foundation
import CoreData

final class Manage{
    
    var models:[NSManagedObject]?
    
    init() {
        
    }
    
    func setModels(models:[NSManagedObject]){
        self.models = models
    }
    
    func getModels()->[NSManagedObject]{
        if let _ = models{
            return models!
        }else{
            return []
        }
    }
    
    
    
}
