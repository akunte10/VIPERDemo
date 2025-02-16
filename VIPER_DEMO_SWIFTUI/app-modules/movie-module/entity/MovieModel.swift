//
//  MovieModel.swift
//  VIPER_DEMO
//
//  Created by Ajay Kunte on 19/01/24.
//

import Foundation
import ObjectMapper

private let ID = "id"
private let TITLE = "title"
private let BRIEF = "brief"
private let IMAGESOURCE = "image_url"

class MovieModel:Mappable{
    
    internal var id:String?
    internal var title:String?
    internal var brief:String?
    internal var imagesource:String?
    
    required init?(map:Map) {
        mapping(map: map)
    }
    
    func mapping(map:Map){
        id <- map[ID]
        title <- map[TITLE]
        brief <- map[BRIEF]
        imagesource <- map[IMAGESOURCE]
    }
    
}
