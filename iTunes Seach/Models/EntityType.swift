//
//  EntityType.swift
//  iTunes Seach
//
//  Created by Mark Perryman on 8/11/22.
//

import Foundation

// The entity type we are looking for
enum EntityType: String, Identifiable, CaseIterable {
    case all
    case album
    case song
    case movie
    
    var id: String {
        self.rawValue
    }
    
    var name: String {
        switch self {
        case .all:
            return "All"
        case .album:
            return "Albums"
        case .song:
            return "Songs"
        case .movie:
            return "Movies"
        }
    }
}
