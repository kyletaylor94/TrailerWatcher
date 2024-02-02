//
//  ComingSoonCell.swift
//  NetflixVision
//
//  Created by Turdesan Csaba on 01/02/2024.
//

import SwiftUI
import Kingfisher

struct ComingSoonCell: View {
    let film: Title
    @StateObject var viewModel = ApiManager()
    
    var body: some View {
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
               
            }
            .font(.subheadline)
            .fontWeight(.semibold)
            .foregroundStyle(.secondary)
            
            Divider()
        }
    }
}
