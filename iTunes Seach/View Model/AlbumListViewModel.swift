//
//  AlbumListViewModel.swift
//  iTunes Seach
//
//  Created by Mark Perryman on 8/10/22.
//

import Foundation
import Combine

// This is the search for an album from iTunes API
// URL: https://itunes.apple.com/search?term=jack+johnson&entity=album&limit=5&offset=10
// URL: https://itunes.apple.com/search?term=jack+johnson&entity=song&limit=5
// URL: https://itunes.apple.com/search?term=jack+johnson&entity=movie&limit=5

class AlbumListViewModel: ObservableObject {    
    @Published var searchTerm: String = ""
    @Published var albums: [Album] = [Album]()
    @Published var state: FetchState = .good
    
    let limit: Int = 20
    var page: Int = 0
    
    let service = APIService()
    
    var subscriptions = Set<AnyCancellable>()
    
    init() {
        $searchTerm
            .dropFirst()
            .debounce(for: .seconds(0.5), scheduler: RunLoop.main)
            .sink { [weak self] term in
                self?.state = .good
                // This clears the search results
                self?.albums = []
                self?.fetchAlbums(for: term)
            }
            .store(in: &subscriptions)
    }
    
    func loadMore() {
        fetchAlbums(for: searchTerm)
    }
    
    func fetchAlbums(for searchTerm: String) {
        // Don't do anthing if we have no searchTerm
        guard !searchTerm.isEmpty else { return }
        
        // If state is anything other than 'good' don't continue
        guard state == FetchState.good else { return }
        
        state = .isLoading

        service.fetchAlbums(searchTerm: searchTerm, page: page, limit: limit) { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let results):
                    for album in results.results {
                        self?.albums.append(album)
                    }
                    self?.page += 1
                    self?.state = (results.results.count == self?.limit) ? .good : .loadedAll
                    print("Fetched: \(results.resultCount)")
                    
                case .failure(let error):
                    self?.state = .error("Couldn't load: \(error.localizedDescription)")
                    print("Error loading albums: \(error)")
                }
            }
        }
    }
    
}
