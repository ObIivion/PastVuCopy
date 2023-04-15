//
//  Model.swift
//  PastVuCopy
//
//  Created by Павел Виноградов on 11.04.2023.
//

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? JSONDecoder().decode(Welcome.self, from: jsonData)

import Foundation

// MARK: - Welcome
struct PhotoInfo: Codable {
    let result: Result
    let rid: String
}

// MARK: - Result
struct Result: Codable {
    let photo: Photo
    let can: Can
    let forEdit: Bool
}

// MARK: - Can
struct Can: Codable {
    let download: String
}

// MARK: - Photo
struct Photo: Codable {
    let type: Int
    let adate, address: String
    let album, ccount, cid: Int
    let desc, dir, file: String
    let frags: [Frag]
    let geo: [Double]
    let h, hs: Int
    let ldate, source, title: String
    let user: User
    let vcount, vdcount, vwcount, w: Int
    let ws, year, year2, s: Int
    let y: String
    let waterh, waterhs: Int
    let cdate, ucdate, watersignCustom: String
    let watersignIndividual, watersignOption: Bool
    let watersignText, watersignTextApplied: String
    let r2D: [Double]
    let regions: [Region]

    enum CodingKeys: String, CodingKey {
        case type, adate, address, album, ccount, cid, desc, dir, file, frags, geo, h, hs, ldate, source, title, user, vcount, vdcount, vwcount, w, ws, year, year2, s, y, waterh, waterhs, cdate, ucdate, watersignCustom, watersignIndividual, watersignOption, watersignText, watersignTextApplied
        case r2D = "r2d"
        case regions
    }
}

// MARK: - Frag
struct Frag: Codable {
    let cid: Int
    let l, t, w, h: Double
}

// MARK: - Region
struct Region: Codable {
    let cid: Int
    let titleLocal: String
    let phc, pac, cc: Int

    enum CodingKeys: String, CodingKey {
        case cid
        case titleLocal = "title_local"
        case phc, pac, cc
    }
}

// MARK: - User
struct User: Codable {
    let login, avatar, disp: String
    let ranks: [String]
    let sex: String
}
