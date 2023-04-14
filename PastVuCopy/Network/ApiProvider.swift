//
//  ApiProvider.swift
//  PastVuCopy
//
//  Created by Павел Виноградов on 13.04.2023.
//

import Foundation
import Combine

class ApiProvider {
    
    private let cid = "cid"
    
    func makeRequest() {
        
        let queryItemMethod = URLQueryItem(name: "method", value: "photo.giveForPage")
        let queryParams = URLQueryItem(name: "params", value: "{cid:5}")
        
        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = "pastvu.com"
        urlComponents.path = "/api2"
        urlComponents.queryItems = [queryItemMethod, queryParams]
        
        print(urlComponents.url)
        
        var request = URLRequest(url: urlComponents.url!)
        request.httpMethod = "GET"
    }
    
    func getPhotosAndClusters() {
        
        makeRequest()
        
        let queryItemMethod = URLQueryItem(name: "method", value: "photo.giveForPage")
        let queryParams = URLQueryItem(name: "params", value: "{\"cid\":5}")
        
        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = "pastvu.com"
        urlComponents.path = "/api2"
        urlComponents.queryItems = [queryItemMethod, queryParams]
        
        print(urlComponents.url)
        
        var request = URLRequest(url: urlComponents.url!)
        request.httpMethod = "GET"
        
        print(#function)
        
                URLSession.shared.dataTask(with: request) { data, _, error in
        
                    guard let data = data, error == nil else { return }
        
                    print(data)
        
                    do {
                        let statusesArray = try JSONSerialization.jsonObject(with: data, options: .allowFragments)
                        print(statusesArray)
                    } catch let error {
                        print("ERROR: \(error)")
        
                    }
                }.resume()
    }
}
