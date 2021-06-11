//
//  NewsView.swift
//  ActualNews
//
//  Created by Егор Никитин on 10.06.2021.
//

import SwiftUI

struct NewsView: View {
    
    @ObservedObject var viewModel: ViewModel = ViewModel()
    
    var body: some View {
        
        NavigationView {
            
            List {
                ForEach(viewModel.articles, id: \.id) { article in
                    NavigationLink(destination: DetailNewsView(article: article)) {
                        ListRow(article: article)
                    }
                }
            }.onAppear {
                viewModel.loadNews()
            }
            .navigationTitle("News")
        }
        .environmentObject(viewModel)
    }
}

