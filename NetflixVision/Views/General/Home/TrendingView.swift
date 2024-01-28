//
//  TrendingView.swift
//  NetflixVision
//
//  Created by Turdesan Csaba on 24/01/2024.
//

import SwiftUI
import Kingfisher

struct TrendingView: View {
    let titleName: String
    let pictures: [Title]
    let function: () -> Void
    
    var body: some View {
        VStack(alignment: .leading){
            Text(titleName)
                .font(.title)
                .fontWeight(.semibold)
            
            ScrollView(.horizontal, showsIndicators: false){
                HStack(spacing: 10){
                    ForEach(pictures) { trendingMovies in
                        KFImage(URL(string: basicUrl + (trendingMovies.poster_path ?? "")))
                            .onFailure { error in
                                print("Image download failed: \(error)")
                                print("Error URL: \(basicUrl + (trendingMovies.poster_path ?? ""))")
                            }
                            .resizable()
                            .scaledToFit()
                            .frame(width: 100, height: 150)
                            .clipShape(RoundedRectangle(cornerRadius: 3))
                    }
                }
            }
            .shadow(radius: 10)
        }
        .padding()
        .onAppear{
            function()
        }
    }
}

//#Preview {
//    TrendingView(titleName: "Trending Movies", pictures: viewModel.trendingMovies) {
//        
//    }
//}
