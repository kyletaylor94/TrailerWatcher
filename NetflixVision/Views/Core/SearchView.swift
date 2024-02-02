//
//  SearchView.swift
//  NetflixVision
//
//  Created by Turdesan Csaba on 24/01/2024.
//

import SwiftUI
import Kingfisher

struct SearchView: View {
    @State private var search: String = ""
    @StateObject var viewModel = ApiManager()
    
    var body: some View {
        NavigationStack{
            VStack(alignment: .leading){
                if search.isEmpty {
                    VStack(spacing: 20){
                        SearchPlaceholderView()
                        ProgressView()
                    }
                } else {
                    ScrollView{
                        ForEach(viewModel.search){ movie in
                            NavigationLink {
                                VideoView(film: movie)
                            } label: {
                                MovieRow(movie: movie)
                            }
                            .buttonStyle(.plain)
                        }
                    }
                }
            }
            .navigationTitle("Top Searches")
            .navigationBarTitleDisplayMode(.inline)
            .padding()
        }
        .searchable(text: $search)
        .onChange(of: search) { newValue in
            viewModel.search(with: newValue)
        }
    }
}


#Preview {
    SearchView()
}
