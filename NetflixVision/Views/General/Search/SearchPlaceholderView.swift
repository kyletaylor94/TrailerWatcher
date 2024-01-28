//
//  SearchPlaceholderView.swift
//  NetflixVision
//
//  Created by Turdesan Csaba on 28/01/2024.
//

import Foundation
import SwiftUI

struct SearchPlaceholderView: View {
    var body: some View {
        VStack {
            Image(systemName: "magnifyingglass")
                .resizable()
                .scaledToFit()
                .frame(width: 50, height: 50)
                .foregroundColor(.gray)
                .padding()
            
            Text("Type something to start searching")
                .font(.title)
                .foregroundStyle(.background)
        }
    }
}
