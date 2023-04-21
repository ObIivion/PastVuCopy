//
//  ApiProvider.swift
//  PastVuCopy
//
//  Created by Павел Виноградов on 13.04.2023.
//

import Foundation
import Combine

class ApiProvider {
    
    private let session: URLSession
    private let requestBuilder = URLRequestBuilder()
    
    init(session: URLSession = .shared) {
        self.session = session
    }
    
    func makeDataRequestByBounds(polygonCoordinates: [[[Double]]],
                                 zoomLevel: UInt,
                                 completion: @escaping (Swift.Result<PhotoByBoundsModel, Error>) -> Void ) {
        
        let request = requestBuilder.makeGeoBoundsRequest(polygonCoordinates: polygonCoordinates, zoomLevel: zoomLevel)
        
        let task = session.dataTask(with: request) { data, response, error in
            
            guard let data = data, error == nil else { return }
            
            do {
                //let statusesArray = try JSONSerialization.jsonObject(with: data, options: .allowFragments)
                let jsonDecoder = JSONDecoder()
                let photoInfo = try jsonDecoder.decode(PhotoByBoundsModel.self, from: data)
                DispatchQueue.main.async {
                    completion(.success(photoInfo))
                }
            } catch let error {
                print("ERROR: \(error)")
                DispatchQueue.main.async {
                    completion(.failure(error))
                }
            }
        }
        task.resume()
    }
}
