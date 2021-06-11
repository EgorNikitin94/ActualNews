//
//  ViewModel.swift
//  ActualNews
//
//  Created by Егор Никитин on 10.06.2021.
//

import Foundation
import Combine

final class ViewModel: ObservableObject {
    @Published var articles: [Article] = []
    
    func loadNews() {
        NetworkManager.sharedInstance.getNews { (news) in
            DispatchQueue.main.async {
                self.articles = news?.articles ?? []
            }
        }
    }
}
