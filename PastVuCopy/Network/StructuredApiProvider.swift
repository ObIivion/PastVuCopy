//
//  StructuredApiProvider.swift
//  PastVuCopy
//
//  Created by Павел Виноградов on 20.04.2023.
//

import Foundation
import Kingfisher
import SwiftyJSON

enum ApiError: Error {
    case responseError
    case decodeError
    case imageResponseError
    case noImageFetched
}

class AsyncAwaitApiProvider {
    
    private let baseImageUrl = Constants.baseImageUrl
    private let session = URLSession.shared
    private let requestBuilder = URLRequestBuilder()
    
    func makeDataRequestByBounds(polygonCoordinates: [[[Double]]], zoomLevel: UInt) async throws -> PhotoByBoundsModel {
        
        let request = requestBuilder.makeGeoBoundsRequest(polygonCoordinates: polygonCoordinates, zoomLevel: zoomLevel)
        
        do {
            let (data, response) = try await session.data(for: request)
            guard let httpResponse = (response as? HTTPURLResponse), httpResponse.statusCode == 200 else { throw ApiError.responseError }
            let jsonDecoder = JSONDecoder()
            jsonDecoder.keyDecodingStrategy = .useDefaultKeys
            let photosInfo = try jsonDecoder.decode(PhotoByBoundsModel.self, from: data)
            return photosInfo
        } catch let error as NSError {
            print("ERROR LOCALIZING DESCRIPTION: ", error)
            throw ApiError.responseError
        }
    }
}


//        func fetchPhoto(fileEndpoint: String) async throws -> UIImage {
//
//            let url = baseImageUrl.appendingPathComponent(fileEndpoint)
//            do {
//                let (data, response) = try await session.data(from: url)
//                guard let httpResponse = (response as? HTTPURLResponse), httpResponse.statusCode == 200 else { throw ApiError.responseError }
//                let image = UIImage(data: data)
//                guard let image = image else { throw ApiError.noImageFetched }
//                return image
//            } catch {
//                throw ApiError.imageResponseError
//            }
//        }
