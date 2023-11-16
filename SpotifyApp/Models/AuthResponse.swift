//
//  AuthResponse.swift
//  Spotify
//
//  Created by Kevin Guzman on 29/08/23.
//

import Foundation

struct AuthResponse: Codable {
    let access_token: String
    let expires_in: Int
    let refresh_token: String?
    let scope: String
    let token_type: String
}

