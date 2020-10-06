//
//  APIFunctions.swift
//  NotesApp
//
//  Created by MD Tanvir Alam on 5/10/20.
//  Copyright © 2020 MD Tanvir Alam. All rights reserved.
//

import Foundation
import Alamofire

struct Note:Decodable{
    var title:String
    var date: String
    var _id: String
    var note: String
}

protocol DataDelegate {
    func updateArray(newArray:String)
}

class APIFunctions{
    
    static let functions = APIFunctions()
    
    var delegate:DataDelegate?
    
    func fetchNotes(){
        AF.request("http://192.168.0.100:8081/fetch").response{ response in
            if let data = response.data{
                if let dataa = String(data: data, encoding: .utf8){
                    self.delegate?.updateArray(newArray: dataa)
                }
                
            }
        }
    }
}