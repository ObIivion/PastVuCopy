//
//  URLBuilder.swift
//  PastVuCopy
//
//  Created by Павел Виноградов on 21.04.2023.
//

import Foundation

class URLRequestBuilder {
    
    func makeGeoBoundsRequest(polygonCoordinates: [[[Double]]], zoomLevel: UInt) -> URLRequest {
        
        var queryParams: URLQueryItem
        
        if zoomLevel >= 17 {
            queryParams = URLQueryItem(name: "params", value: "{\"z\":\(zoomLevel),\"geometry\":{\"type\":\"Polygon\",\"coordinates\":\(polygonCoordinates)},\"localWork\":1}".replacingOccurrences(of: " ", with: ""))
        } else {
            queryParams = URLQueryItem(name: "params", value: "{\"z\":\(zoomLevel),\"geometry\":{\"type\":\"Polygon\",\"coordinates\":\(polygonCoordinates)}}".replacingOccurrences(of: " ", with: ""))
        }
        
        let queryItemMethod = URLQueryItem(name: "method", value: "photo.getByBounds")
        
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
