//
//  PhotoByBoundsModel.swift
//  PastVuCopy
//
//  Created by Павел Виноградов on 20.04.2023.
//
// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let photoByBoundsModel = try? JSONDecoder().decode(PhotoByBoundsModel.self, from: jsonData)

import Foundation

// MARK: - PhotoByBoundsModel
struct PhotoByBoundsModel: Codable {
    let result: Result?
    let rid: String
}

// MARK: - Result
struct Result: Codable {
    let z: Int
    let photos: [Photo]
    let clusters: [Cluster]?
}

// MARK: - Cluster
struct Cluster: Codable {
    let p: Photo?
    let geo: [Double]
    let c: Int
}

// MARK: - Photo
struct Photo: Codable {
    let cid: Int
    let file, title: String
    let geo: [Double]
    let year, year2: Int
    let dir: String?
}
