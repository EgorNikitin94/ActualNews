//
//  NetworkManager.swift
//  ActualNews
//
//  Created by Егор Никитин on 10.06.2021.
//

import Foundation


final class NetworkManager {
    
    static let sharedInstance = NetworkManager()
    
    private let session = URLSession.shared
    
    private init(){}
    
    private func dataTask(completion: @escaping (Data?) -> Void) {
        
        let country = "ru"
        
        guard let url = URL(string: "https://newsapi.org/v2/top-headlines?country=\(country)&apiKey=\(ApiKeys.newsApiKey.rawValue)") else {
            return
        }
        
        let task = session.dataTask(with: url) { data, response, error in
            
            guard error == nil else {
                print(error.debugDescription)
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else { return }
            
            if let data = data {
                completion(data)
            }
        }
        task.resume()
    }
    
    public func getNews(completion: @escaping (NewsData?) -> Void) {
        dataTask { (data) in
            
            if let newsData = data, let news = try? NewsData(data: newsData) {
                completion(news)
            } else {
                completion(nil)
            }
        }
    }
    
}
