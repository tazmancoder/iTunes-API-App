//
//  SearchView.swift
//  iTunes Seach
//
//  Created by Mark Perryman on 8/11/22.
//

import SwiftUI

struct SearchView: View {
    @StateObject private var albumListVM = AlbumListViewModel()
    @StateObject private var movieListVM = MovieListViewModel()
    @StateObject private var songListVM = SongListViewModel()

    @State private var searchTerm = ""
    @State private var selectedType: EntityType = .all
    
    var body: some View {
        NavigationView {
            VStack {
                Picker("Select the media", selection: $selectedType) {
                    ForEach(EntityType.allCases) { type in
                        Text(type.name)
                            .tag(type)
                    }
                }
                .pickerStyle(.segmented)
                .padding(.horizontal)
                
                Divider()
                
                if searchTerm.isEmpty {
                    SearchPlaceholderView(searchTerm: $searchTerm)
                        .frame(maxHeight: .infinity)
                } else {
                    switch selectedType {
                    case .all:
                        SearchAllListView(albumListVM: albumListVM,
                                          movieListVM: movieListVM,
                                          songListVM: songListVM)
                            .onAppear {
                                albumListVM.searchTerm = searchTerm
                                songListVM.searchTerm = searchTerm
                                movieListVM.searchTerm = searchTerm
                            }
                    case .album:
                        AlbumListView(vm: albumListVM)
                            .onAppear {
                                albumListVM.searchTerm = searchTerm
                            }
                    case .song:
                        SongListVIew(vm: songListVM)
                            .onAppear {
                                songListVM.searchTerm = searchTerm
                            }
                    case .movie:
                        MovieListView(vm: movieListVM)
                            .onAppear {
                                movieListVM.searchTerm = searchTerm
                            }
                    }
                }
                                
                Spacer()
            }
            .searchable(text: $searchTerm, placement: .navigationBarDrawer(displayMode: .always))
            .navigationTitle("Search")
            .navigationBarTitleDisplayMode(.inline)
        }
        .onChange(of: searchTerm) { newValue in
            switch selectedType {
            case .all:
                albumListVM.searchTerm = newValue
                songListVM.searchTerm = newValue
                movieListVM.searchTerm = newValue
            case .album:
                albumListVM.searchTerm = newValue
            case .song:
                songListVM.searchTerm = newValue
            case .movie:
                movieListVM.searchTerm = newValue
            }
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
