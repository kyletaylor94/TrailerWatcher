//
//  VideoView.swift
//  NetflixVision
//
//  Created by Turdesan Csaba on 28/01/2024.
//

import SwiftUI
import WebKit

struct VideoView: View {
    let titleName: String
    let description: String
    let url: String
    
    @StateObject var viewModel = ApiManager()
    
    var body: some View {
        ScrollView{
            VStack(alignment: .leading, spacing: 20){
                WebView(url: URL(string: youtubeUrl + url)!)
                    .frame(height: 370, alignment: .top)
                
                Text(titleName)
                    .font(.title)
                    .fontWeight(.semibold)
                    .foregroundStyle(.secondary)
                    .padding(.horizontal)
                
                Text(description)
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
                    .padding(.horizontal)
                
            }
            
            Button(action: {
                //
            }, label: {
                Text("Download")
            })
            .font(.title2)
            .foregroundStyle(.red)
        }
        .onAppear{
            viewModel.getMovieYoutube(with: "\(titleName) trailer ")
            print( viewModel.getMovieYoutube(with: "\(titleName) trailer "))
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

#Preview {
    VideoView(titleName: "Venom", description: "Description of Venom", url: "\(youtubeUrl)")
}
