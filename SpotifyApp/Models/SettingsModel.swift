//
//  SettingsModel.swift
//  Spotify
//
//  Created by Kevin Guzman on 4/09/23.
//

import Foundation

struct Section {
    let title: String
    let options: [Option]
}

struct Option {
    let title: String
    let handler: () -> Void
}
