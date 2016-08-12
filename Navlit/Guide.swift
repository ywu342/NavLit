//
//  Guide.swift
//  Navlit
//
//  Created by Viraj Shah on 5/28/16.
//  Copyright © 2016 Viraj Shah. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON
import AlamofireObjectMapper
import ObjectMapper


class Guide: Mappable {
    var searchId: String?
    var results: [Results]?
    
    required init?(_ map: Map) {

    }
    
    func mapping(map: Map) {
        searchId <- map["SearchId"]
        results  <- map["Results"]
    }
}

class Results: Mappable {
    var UserId: String?
    var Name: String?
    var ProfilePicture: String?
    var Bio: String?
    var Gender: Int?
    var CommonInterests: [String] = []
    
    required init?(_ map: Map) {
        
    }
    
    // Mappable
    func mapping(map: Map) {
        UserId                <- map["UserId"]
        Name                  <- map["Name"]
        ProfilePicture        <- map["ProfilePicture"]
        Bio                   <- map["Bio"]
        CommonInterests       <- map["CommonInterests"]
        Gender                <- map["Gender"]
        
    }

}





