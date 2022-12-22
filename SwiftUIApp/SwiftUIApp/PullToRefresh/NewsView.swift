//
//  NewView.swift
//  SwiftUIApp
//
//  Created by Bizplay on 2022/12/22.
//

import SwiftUI

struct NewsView: View {
    
    @State private var news = [NewsModel(id: 0, title: "Want the latest news?", strap: "Pull to refresh!")]
    
    var body: some View {
        NavigationStack {
            List(news) { news in
                VStack(alignment:.leading) {
                    Text(news.title)
                        .font(.headline)
                    
                    Text(news.strap)
                        .foregroundColor(.secondary)
                }
            }
            .refreshable {
                do {
                    // Fetch and decode JSON into news items
                
                    let url = URL(string: "https://www.hackingwithswift.com/samples/news-1.json")!
                    let (data, _) = try await URLSession.shared.data(from: url)
                    news = try JSONDecoder().decode([NewsModel].self, from: data)
                }catch {
                    news = []
                }
            }
        }
    }
}

struct NewsView_Previews: PreviewProvider {
    static var previews: some View {
        NewsView()
    }
}
