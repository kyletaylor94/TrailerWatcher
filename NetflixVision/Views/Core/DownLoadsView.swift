//
//  DownLoadsView.swift
//  NetflixVision
//
//  Created by Turdesan Csaba on 24/01/2024.
//

import SwiftUI

struct DownLoadsView: View {
    @ObservedObject var viewModel = ApiManager()
    var body: some View {
        VStack{
            Text("downloads")
        }.onAppear{
            viewModel.getMovieYoutube(with: "venom trailer")
            print(viewModel.youtubeSearch)
        }
    }
}

#Preview {
    DownLoadsView()
}
