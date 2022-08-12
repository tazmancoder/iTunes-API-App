//
//  SongsForAlbumListViewModel.swift
//  iTunes Seach
//
//  Created by Mark Perryman on 8/12/22.
//

import Foundation

class SongsForAlbumListViewModel: ObservableObject {
    @Published var songs = [Song]()
    @Published var state: FetchState = .good
    
    let albumID: Int
    let service = APIService()
    
    init(albumID: Int) {
        self.albumID = albumID
        print("Init for songs for album \(albumID)")
    }
    
    func fetch() {
        fetchSongs(for: albumID)
    }
    
    private func fetchSongs(for albumID: Int) {
        service.fetchSongs(for: albumID) { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                    case .success(let results):
                        // Doing this because the first entry is not valid
                        var songs = results.results
                        if results.resultCount > 0 {
                            _ = songs.removeFirst()
                        }
                    
                        self?.songs = songs
                        self?.state = .good
                        print("Fetched \(results.resultCount) for albumID: \(albumID)")
                        
                    case .failure(let error):
                        print("Could not load: \(error)")
                        self?.state = .error(error.localizedDescription)
                }
            }
        }
    }
    
    func example() -> SongsForAlbumListViewModel {
        let vm = SongsForAlbumListViewModel(albumID: 1)
        vm.songs = [Song.example()]
        return vm
    }
}
