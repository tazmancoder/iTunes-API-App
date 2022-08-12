//
//  AlbumListView.swift
//  iTunes Seach
//
//  Created by Mark Perryman on 8/10/22.
//

import SwiftUI

struct AlbumListView: View {
    
    @ObservedObject var vm: AlbumListViewModel
    
    var body: some View {
        
        List {
            ForEach(vm.albums) { album in
                NavigationLink {
                    AlbumDetailView(album: album)
                } label: {
                    AlbumRowView(album: album)
                }

            }
            
            ListPlaceholderRowView(state: vm.state,
                                   loadMore: vm.loadMore)
        }
        .listStyle(.plain)
        
    }
}

struct AlbumListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            AlbumListView(vm: AlbumListViewModel())
        }
    }
}

