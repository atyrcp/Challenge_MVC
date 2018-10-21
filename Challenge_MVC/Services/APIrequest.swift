//
//  APIrequest.swift
//  Challenge_MVC
//
//  Created by z on 2018/10/18.
//  Copyright © 2018年 z. All rights reserved.
//

import Foundation
import UIKit

class APIrequest {
    
    typealias completionHandle = (_ gotcha: [RandomImage], _ hailno: Error?) -> Void
    
    static func createImage(from urlString: String) -> UIImage {
        let url = URL(string: urlString)
        let data = try? Data(contentsOf: url!)
        let image = UIImage(data: data!)
        return image!
    }
    
    static func createImages(from dataArray: [RandomImage]) -> [UIImage] {
        var imageArray = [UIImage]()
        for data in dataArray {
            let image = self.createImage(from: data.urls.regular)
            imageArray.append(image)
        }
        return imageArray
    }
    
    static func createRatios(from dataArray: [RandomImage]) -> [CGFloat] {
        var ratioArray = [CGFloat]()
        for data in dataArray {
            let ratio = CGFloat(data.width / data.height)
            ratioArray.append(ratio)
        }
        return ratioArray
    }
    
    
    static func askForImage(from requestURL: String, result: @escaping completionHandle){
        
        print("request begins")
        
        guard let baseURL = URL(string: "https://api.unsplash.com/\(requestURL)") else {print("no such url"); return}
        var request = URLRequest(url: baseURL)
        request.setValue("Client-ID 7f748ab5181766a6a4236956b9d8bfb0e2064f3637e438f2daab657834eb2396", forHTTPHeaderField: "Authorization")
        
        let task = URLSession.shared.dataTask(with: request) { (sourceData, sourceResponse, SourceError) in
            guard let data = sourceData else {print(SourceError!); return}
            
            let receiveDatas = try? JSONDecoder().decode([RandomImage].self, from: data)
            
            print("receive: \(receiveDatas)")
            result(receiveDatas!, nil)
        }
        task.resume()
    }
}
