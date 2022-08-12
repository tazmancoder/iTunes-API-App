//
//  FetchState.swift
//  iTunes Seach
//
//  Created by Mark Perryman on 8/10/22.
//

import Foundation

// This is the state of the search from iTunes API
enum FetchState: Comparable {
    case good
    case isLoading
    case loadedAll
    case noResults
    case error(String)
}

