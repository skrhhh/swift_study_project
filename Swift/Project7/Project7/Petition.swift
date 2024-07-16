//
//  Petition.swift
//  Project7
//
//  Created by admin on 2024/6/24.
//

import Foundation
struct Petition: Codable {
    var title: String
        var body: String
        var signatureCount: Int
}

struct Petitions: Codable {
    var results: [Petition]
}
