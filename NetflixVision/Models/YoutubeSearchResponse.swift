//
//  YoutubeSearchResponse.swift
//  NetflixVision
//
//  Created by Turdesan Csaba on 24/01/2024.
//

import Foundation

struct YoutubeSearchResponse: Codable {
    let items: [VideoElement]
}

struct VideoElement: Codable {
    var id: VideoElementID
}

struct VideoElementID: Codable {
    let kind: String
    var videoId: String
}


