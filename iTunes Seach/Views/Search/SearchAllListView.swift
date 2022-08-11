//
//  SearchAllListView.swift
//  iTunes Seach
//
//  Created by Mark Perryman on 8/11/22.
//

import SwiftUI

struct SearchAllListView: View {
    @ObservedObject var albumListVM: AlbumListViewModel
    @ObservedObject var movieListVM: MovieListViewModel
    @ObservedObject var songListVM: SongListViewModel

    var body: some View {
        Text("Search All")
        Text("Albums Count: \(albumListVM.albums.count)")
        Text("Movies Count: \(movieListVM.movies.count)")
        Text("Songs Count: \(songListVM.songs.count)")
    }
}

//struct SearchAllListView_Previews: PreviewProvider {
//    static var previews: some View {
//        SearchAllListView()
//    }
//}
