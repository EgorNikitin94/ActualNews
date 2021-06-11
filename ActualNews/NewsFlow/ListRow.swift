//
//  ListRow.swift
//  ActualNews
//
//  Created by Егор Никитин on 10.06.2021.
//

import SwiftUI

struct ListRow: View {
    
    let article: Article
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 10) {
            Text(article.title)
                .fontWeight(.bold)
            Text(article.description)
                .font(.callout)
                .lineLimit(1)
                
        }
    }
}
