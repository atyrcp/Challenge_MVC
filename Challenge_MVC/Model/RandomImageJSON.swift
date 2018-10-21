//
//  RandomImageJSON.swift
//  Challenge_MVC
//
//  Created by z on 2018/10/18.
//  Copyright © 2018年 z. All rights reserved.
//

import Foundation

struct RandomImage: Decodable {
    let id: String
    let width: Float
    let height: Float
    let color: String
    let urls: URLs
    let links: Links
    let user: User
    
    struct URLs: Decodable {
        let raw: String
        let full: String
        let regular: String
        let small: String
        let thumb: String
    }
    
    struct Links: Decodable {
        let download_location: String
    }
    
    struct User: Decodable {
        let name: String
    }
}
