//
//  ApiProvider.swift
//  PastVuCopy
//
//  Created by Павел Виноградов on 13.04.2023.
//

import Foundation
import Combine

class ApiProvider {
    
    let session: URLSession
    
    init(session: URLSession = .shared) {
        self.session = session
    }
    
    func makeRequest() -> URLRequest {
        
        let queryItemMethod = URLQueryItem(name: "method", value: "photo.giveForPage")
        let queryParams = URLQueryItem(name: "params", value: "{\"cid\":5}")
        
        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = "pastvu.com"
        urlComponents.path = "/api2"
        urlComponents.queryItems = [queryItemMethod, queryParams]
        
        var request = URLRequest(url: urlComponents.url!)
        request.httpMethod = "GET"
        
        return request
    }
    
    func makePhotoRequestByBounds() -> URLRequest {
        
        let queryItemMethod = URLQueryItem(name: "method", value: "photo.getByBounds")
        let queryParams = URLQueryItem(name: "params", value: "{\"cid\":5}")
        
        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = "pastvu.com"
        urlComponents.path = "/api2"
        urlComponents.queryItems = [queryItemMethod, queryParams]
        
        var request = URLRequest(url: urlComponents.url!)
        request.httpMethod = "GET"
        
        return request
        
    }
    
    func getPhotosAndClusters() {
        
        let request = makeRequest()
        
        let task = session.dataTask(with: request) { data, _, error in
            
            guard let data = data, error == nil else { return }
            
            print(data)
            
            do {
                let statusesArray = try JSONSerialization.jsonObject(with: data, options: .allowFragments)
                print(statusesArray)
            } catch let error {
                print("ERROR: \(error)")
            }
        }
        task.resume()
    }
}
