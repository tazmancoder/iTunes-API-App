//
//  SongListVIew.swift
//  iTunes Seach
//
//  Created by Mark Perryman on 8/11/22.
//

import SwiftUI

struct SongListVIew: View {
    @ObservedObject var vm: SongListViewModel
    
    var body: some View {
        List {
            ForEach(vm.songs) { song in
                NavigationLink {
                    SongDetailView(song: song)
                } label: {
                    SongRowView(song: song)
                }
            }
            
            ListPlaceholderRowView(state: vm.state, loadMore: vm.loadMore)
        }
        .listStyle(.plain)
    }
}

struct SongListVIew_Previews: PreviewProvider {
    static var previews: some View {
        SongListVIew(vm: SongListViewModel.example())
    }
}
