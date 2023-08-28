//
//  User.swift
//  SwiftuiAuth
//
//  Created by man ching chan on 28/8/2023.
//

import Foundation


struct User : Identifiable,Codable{
    
    
    let id : String
    let email : String
    let fullname : String
    
    
    var initials:String{
        
        let formatter = PersonNameComponentsFormatter()
        
        if let components = formatter.personNameComponents(from: fullname){
            
            formatter.style = .abbreviated
            return formatter.string(from: components)
        }
        
        return ""
        
        
    }
    
}


extension User{
    
    
    static var MOCK_USER = User(id: NSUUID().uuidString, email: "test@gmail.com", fullname: "Kobe Bryant")
}
