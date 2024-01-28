//
//  HomeView.swift
//  NetflixVision
//
//  Created by Turdesan Csaba on 24/01/2024.
//

import SwiftUI
import Kingfisher

struct HomeView: View {
    @ObservedObject var viewModel = ApiManager()
    @State var screenWidth: CGFloat = 0
    
    private var coverPicture: Title? {
        return viewModel.trendingMovies.randomElement()
    }
    
    var body: some View {
        NavigationStack{
            GeometryReader { geometry in
                ScrollView{
                    ZStack(alignment: .bottom){
                        if let topPicture = coverPicture{
                            KFImage(URL(string: basicUrl + (topPicture.poster_path ?? "") ))
                                .resizable()
                                .scaledToFill()
                                .frame(width: screenWidth, height: 200)
                                .clipShape(RoundedRectangle(cornerRadius: 8))
                                .onAppear{
                                    self.screenWidth = geometry.size.width
                                }
                        }
                        
                        HStack(spacing: 30){
                            Button(action: {
                                //
                            }, label: {
                                Text("Play")
                            })
                            
                            Button(action: {
                                //
                            }, label: {
                                Text("Download")
                            })
                        }
                    }
                    
                    VStack{
                        TrendingView(titleName: "Trending Movies", pictures: viewModel.trendingMovies) {
                            viewModel.getTrendingMovies()
                        }
                        
                        TrendingView(titleName: "Trending TVS", pictures: viewModel.trendingTvs) {
                            viewModel.getTrendingTvs()
                        }
                        
                        TrendingView(titleName: "Upcoming Movies", pictures: viewModel.upcomingMovies) {
                            viewModel.getUpcomingMovies()
                        }
                        
                        TrendingView(titleName: "Popular", pictures: viewModel.popularMovies) {
                            viewModel.getPopularMovies()
                        }
                        
                        TrendingView(titleName: "Top Rated", pictures: viewModel.topRatedMovies) {
                            viewModel.getToprated()
                        }
                        
                        TrendingView(titleName: "Discover", pictures: viewModel.discoverMovies) {
                            viewModel.getDiscoverMovies()
                        }
                        
                    }
                }
            }
        }
    }
}

#Preview {
    HomeView()
}
