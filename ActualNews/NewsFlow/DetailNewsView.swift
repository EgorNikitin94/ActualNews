//
//  DetailNewsView.swift
//  ActualNews
//
//  Created by Егор Никитин on 11.06.2021.
//

import SwiftUI

struct DetailNewsView: View {
    
    let article: Article
    
    var body: some View {
        WebView(type: .public, url: article.url)
            
    }
}

