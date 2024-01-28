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
    let videoElement: [VideoElement] = []
    
    var body: some View {
        NavigationStack{
            ScrollView{
                VStack(alignment: .leading){
                    Divider()
                    ForEach(viewModel.upcomingMovies){ film in
                        HStack{
                            KFImage(URL(string: "\(basicUrl + (film.poster_path ?? ""))"))
                                .resizable()
                                .scaledToFit()
                                .clipShape(RoundedRectangle(cornerRadius: 20.0))
                                .frame(width: 200, height: 200)
                            
                            
                            Text(film.original_name ?? film.original_title ?? "")
                                .font(.title)
                                .fontWeight(.bold)
                            
                            Spacer()
                            
                            VStack{
                                Text("Release date: ")
                                Text(film.release_date ?? "")
                                
                                NavigationLink {
                                    VideoView(titleName: film.original_name ?? film.original_title ?? "", description: film.overview ?? "", url: film.original_name ?? film.original_title! + "trailer")
                                       
                                } label: {
                                    Text("More")
                                }
                              

                            }
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .foregroundStyle(.secondary)
                            

                            Divider()
                        }
                        
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
