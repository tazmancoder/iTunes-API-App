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
            LazyVStack {
                HStack {
                    Text("Songs")
                        .font(.body)

                    Spacer()
                    
                    NavigationLink(destination: SongListVIew(vm: songListVM)) {
                        HStack {
                            Text("See All")
                            Image(systemName: "chevron.right")
                                .offset(x: -9)
                                .scaleEffect(0.8)
                        }
                        .foregroundColor(.gray)
                    }
                }
                .font(.caption)
                .padding(.horizontal)
                
                SongSectionView(songs: songListVM.songs)
                
                Divider()
                    .padding(.bottom)
                
                HStack {
                    Text("Albums")
                        .font(.body)
                    
                    Spacer()
                    
                    NavigationLink(destination: AlbumListView(vm: albumListVM)) {
                        HStack {
                            Text("See All")
                            Image(systemName: "chevron.right")
                                .offset(x: -9)
                                .scaleEffect(0.8)

                        }
                        .foregroundColor(.gray)
                    }
                }
                .font(.caption)
                .padding(.horizontal)
                
                AlbumSectionView(albums: albumListVM.albums)
                
                Divider()
                    .padding(.bottom)
                
                HStack {
                    Text("Movies")
                        .font(.body)

                    Spacer()
                    
                    NavigationLink(destination: MovieListView(vm: movieListVM)) {
                        HStack {
                            Text("See All")
                            Image(systemName: "chevron.right")
                                .offset(x: -9)
                                .scaleEffect(0.8)
                        }
                        .foregroundColor(.gray)
                    }
                }
                .font(.caption)
                .padding(.horizontal)
                
                MovieSectionView(movies: movieListVM.movies)
            }
        }
    }
}

struct SearchAllListView_Previews: PreviewProvider {
    static var previews: some View {
        SearchAllListView(albumListVM: AlbumListViewModel.example(), movieListVM: MovieListViewModel.example(), songListVM: SongListViewModel.example())
    }
}
