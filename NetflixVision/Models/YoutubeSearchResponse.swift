//
//  YoutubeSearchResponse.swift
//  NetflixVision
//
//  Created by Turdesan Csaba on 24/01/2024.
//

import Foundation

struct YoutubeSearchResponse: Codable {
  //  var id: Int
    let items: [VideoElement]
}

struct VideoElement: Codable {
 //   var id: Int
    var id: VideoElementID
}

struct VideoElementID: Codable {
    let kind: String
    let videoId: String
}


