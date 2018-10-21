//
//  QueryImageJSON.swift
//  Challenge_MVC
//
//  Created by z on 2018/10/21.
//  Copyright © 2018年 z. All rights reserved.
//

import Foundation

struct QueryImage: Decodable {
    let results: [result]
    
    struct result:Decodable {
        let width: Float
        let height: Float
        let urls: URLs
        
        struct URLs: Decodable {
            let raw: String
            let full: String
            let regular: String
            let small: String
            let thumb: String
        }
    }
    
}
