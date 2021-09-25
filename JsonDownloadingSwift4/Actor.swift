
//
//  Actor.swift
//  JsonDownloadingSwift4
//
//  Created by Raj on 21/06/17.
//  Copyright © 2017 Raj. All rights reserved.
//

import UIKit

class Actors:Codable {
    let actors:[Actor]
    init(actors:[Actor]) {
        self.actors = actors
    }
}

class Actor: Codable{
    let name:String
    let description: String
    let dob: String
    let country: String
    let height:String
    let spouse:String
    let children:String
    let image:String
    
    init(name:String,description:String,dob:String,country:String,height:String,spouse:String,children:String,image:String) {
        self.name = name
        self.description = description
        self.dob = dob
        self.country = country
        self.height = height
        self.spouse = spouse
        self.children = children
        self.image = image
    }
}
