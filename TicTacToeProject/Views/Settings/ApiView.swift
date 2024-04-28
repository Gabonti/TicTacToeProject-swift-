//
//  ApiView.swift
//  TicTacToeProject
//
//  Created by Gabdilkarim Ata on 27.04.2024.
//

import SwiftUI

struct Quote: Codable {
    var _id: String
    var content: String
    var author: String
}

struct ApiView: View {
    @State private var quotes: [Quote] = []
    @AppStorage("isDarkMode") var isDarkMode = false
    
    var body: some View {
        VStack {
            if !quotes.isEmpty {
                List(quotes, id: \._id) { quote in
                    VStack(alignment: .leading, spacing: 8) {
                        Text(quote.author)
                            .font(.headline)
                            .foregroundColor(isDarkMode ? .white : .black)
                        Text(quote.content)
                            .font(.body)
                            .foregroundColor(isDarkMode ? .white : .black)
                    }
                    .padding()
                }
            } else {
                ProgressView()
            }
        }
        .navigationTitle("Quotes")
        .task {
            await fetchData()
        }
    }
    
    func fetchData() async {
        guard var components = URLComponents(string: "https://api.quotable.io/quotes/random") else {
            print("Invalid URL")
            return
        }
        
        components.queryItems = [
            URLQueryItem(name: "limit", value: "5")
        ]
        
        guard let url = components.url else {
            print("Invalid URL")
            return
        }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let decodedData = try JSONDecoder().decode([Quote].self, from: data)
            DispatchQueue.main.async {
                self.quotes = decodedData
            }
        } catch {
            print("This data isn't valid")
        }
    }
}

#Preview {
    ApiView()
}
