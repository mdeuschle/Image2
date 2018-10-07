//
//  SampleURLs.swift
//  Image2
//
//  Created by Matt Deuschle on 10/6/18.
//  Copyright © 2018 Matt Deuschle. All rights reserved.
//

import Foundation

struct SampleURL {
    static let golfURL = Bundle.main.url(forResource: "golf", withExtension: "jpg")

    static var NASA: [String: URL] = {
        let urlStrings: [String: String] = [
            "Cassini": "https://www.jpl.nasa.gov/images/cassini/20090202/pia03883-full.jpg",
            "Earth": "https://www.nasa.gov/sites/default/files/wave_earth_mosaic_3.jpg",
            "Saturn": "https://www.nasa.gov/sites/default/files/saturn_collage.jpg"
        ]
        var urls: [String: URL] = [:]
        for (key, value) in urlStrings {
            urls[key] = URL(string: value)
        }
        return urls
    }()
}
