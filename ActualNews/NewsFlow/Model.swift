//
//  Model.swift
//  ActualNews
//
//  Created by Егор Никитин on 10.06.2021.
//

import Foundation

struct NewsData: Decodable {
    let status: String
    let totalResults: Int
    let articles: [Article]
    
    init(data: Data) throws {
        self = try JSONDecoder().decode(NewsData.self, from: data)
    }
}

struct Article: Decodable, Identifiable {
    var id: UUID = UUID()
    let author: String?
    let title: String
    let url: URL
    let description: String
    
    enum CodingKeys: String, CodingKey {
            case author, title, description, url
        }
}
