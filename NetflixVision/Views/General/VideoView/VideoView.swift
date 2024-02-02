//
//  VideoView.swift
//  NetflixVision
//
//  Created by Turdesan Csaba on 28/01/2024.
//

import SwiftUI
import WebKit

struct VideoView: View {
    let film: Title
    @StateObject var viewModel = ApiManager()
    @State private var youtubeSearch: String = ""
    
    var body: some View {
        ScrollView{
            if youtubeSearch.isEmpty {
                ProgressView()
            } else {
                
                VStack(alignment: .leading, spacing: 20){
                    WebView(url: URL(string: youtubeUrl + youtubeSearch)!)
                        .frame(height: 370, alignment: .top)
                    
                    Text(film.original_title ?? film.original_name ?? "")
                        .font(.title)
                        .fontWeight(.semibold)
                        .foregroundStyle(.secondary)
                        .padding(.horizontal)
                    
                    Text(film.overview ?? "")
                        .font(.subheadline)
                        .foregroundStyle(.secondary)
                        .padding(.horizontal)
                    
                }
                
                Button(action: {
                    //
                }, label: {
                    Text("Download")
                })
                .font(.title3)
                .foregroundStyle(.red)
            }
        }
        .onAppear{
            viewModel.getMovieYoutube(with: film.original_title ?? film.original_name ?? "") { videoId in
                DispatchQueue.main.async {
                    self.youtubeSearch = videoId[0].id.videoId
                }
            }
        }
    }
}

struct WebView: UIViewRepresentable {
    var url: URL
    func makeUIView(context: Context) -> some UIView {
        let webView = WKWebView()
        let request = URLRequest(url: url)
        webView.load(request)
        return webView
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        //
    }
}
