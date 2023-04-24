//
//  URLBuilder.swift
//  PastVuCopy
//
//  Created by Павел Виноградов on 21.04.2023.
//

import Foundation

class URLRequestBuilder {
    
    func makeGeoBoundsRequest(polygonCoordinates: [[[Double]]], zoomLevel: UInt) -> URLRequest {
        
        let queryItemMethod = URLQueryItem(name: "method", value: "photo.getByBounds")
        let queryParams = URLQueryItem(name: "params", value: "{\"z\":\(zoomLevel),\"geometry\":{\"type\":\"Polygon\",\"coordinates\":\(polygonCoordinates)}}".replacingOccurrences(of: " ", with: ""))
        
        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = "pastvu.com"
        urlComponents.path = "/api2"
        urlComponents.queryItems = [queryItemMethod, queryParams]
        
        var request = URLRequest(url: urlComponents.url!)
        request.httpMethod = "GET"
        
        return request
    }
}
