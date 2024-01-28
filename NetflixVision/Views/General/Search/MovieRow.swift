//
//  MovieRow.swift
//  NetflixVision
//
//  Created by Turdesan Csaba on 28/01/2024.
//

import Foundation
import SwiftUI
import Kingfisher

struct MovieRow: View {
    let movie: Title
    
    var body: some View {
        HStack {
            if let picture = movie.poster_path {
                KFImage(URL(string: basicUrl + picture))
                    .resizable()
                    .scaledToFit()
                    .frame(height: 150)
                    .clipShape(RoundedRectangle(cornerRadius: 8))
                
                Text(movie.original_title ?? movie.original_name ?? "")
                    .font(.title)
                    .fontWeight(.semibold)
                
                Spacer()
            } else {
                ProgressView()
            }
        }
    }
}
