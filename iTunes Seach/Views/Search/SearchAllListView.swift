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
        ScrollView {
            LazyVStack(spacing: 5) {
                if !songListVM.songs.isEmpty {
                    SectionHeaderView(title: "Songs") {
                        SongListVIew(vm: songListVM)
                    }
                    .padding(.top)
                    
                    SongSectionView(songs: songListVM.songs)
                    
                    Divider()
                        .padding(.bottom)
                }
                
                if !albumListVM.albums.isEmpty {
                    SectionHeaderView(title: "Albums") {
                        AlbumListView(vm: albumListVM)
                    }
                    
                    AlbumSectionView(albums: albumListVM.albums)
                    
                    Divider()
                        .padding(.bottom)
                }
                
                if !movieListVM.movies.isEmpty {
                    SectionHeaderView(title: "Movies") {
                        MovieListView(vm: movieListVM)
                    }
                    
                    MovieSectionView(movies: movieListVM.movies)
                }
            }
        }
    }
}

struct SearchAllListView_Previews: PreviewProvider {
    static var previews: some View {
        SearchAllListView(albumListVM: AlbumListViewModel.example(), movieListVM: MovieListViewModel.example(), songListVM: SongListViewModel.example())
    }
}

struct SectionHeaderView<Destination>: View where Destination : View {
    
    let title: String
    let destination:  () -> Destination
    
    init(title: String, @ViewBuilder destination: @escaping () -> Destination) {
        self.title = title
        self.destination = destination
    }
    
    var body: some View {
        HStack {
            Text(title)
                .font(.title2)
            Spacer()
            
            NavigationLink(destination: destination) {
                HStack {
                    Text("See all")
                        .font(.caption)
                    Image(systemName: "chevron.right")
                        .scaleEffect(0.7)
                }
                .foregroundColor(.gray)
            }
        }
        .padding(.horizontal)
    }
}
