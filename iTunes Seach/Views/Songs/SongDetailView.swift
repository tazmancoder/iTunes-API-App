//
//  SongDetailView.swift
//  iTunes Seach
//
//  Created by Mark Perryman on 8/12/22.
//

import SwiftUI

struct SongDetailView: View {
    
    @StateObject var songsVM: SongsForAlbumListViewModel
    @StateObject var albumsVM = AlbumForSongViewModel()
    
    let song: Song
    
    init(song: Song) {
        self.song = song
        let albumID = song.collectionID
        _songsVM = StateObject(wrappedValue: SongsForAlbumListViewModel(albumID: albumID))
    }
    
    var body: some View {
        
        VStack(spacing: 0) {
            
            if let album = albumsVM.album {
                AlbumHeaderDetailView(album: album)
            } else if albumsVM.state == .isLoading {
                ProgressView()
                    .progressViewStyle(.circular)
            }
            
             Divider()
            
            SongsForAlbumListView(songsVM: songsVM,
                                  selectedSong: song)
            
        }
        .onAppear {
            songsVM.fetch()
            albumsVM.fetch(song: song)
        }
    }
}

struct SongDetailView_Previews: PreviewProvider {
    static var previews: some View {
        SongDetailView(song: Song.example())
    }
}
