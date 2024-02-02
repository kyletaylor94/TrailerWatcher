//
//  ComingSoonView.swift
//  NetflixVision
//
//  Created by Turdesan Csaba on 24/01/2024.
//

import SwiftUI
import Kingfisher

struct ComingSoonView: View {
    @ObservedObject var viewModel = ApiManager()
    
    var body: some View {
        NavigationStack{
            ScrollView{
                VStack(alignment: .leading){
                    ForEach(viewModel.upcomingMovies){ film in
                        Divider()
                        NavigationLink {
                            VideoView(film: film)
                        } label: {
                            ComingSoonCell(film: film)
                        }
                        .buttonStyle(.plain)
                    }
                }
                .navigationBarTitleDisplayMode(.inline)
                .navigationTitle("Coming Soon")
                .padding()
            }
            .onAppear{
                viewModel.getUpcomingMovies()
            }
        }
    }
}

#Preview {
    ComingSoonView()
}
