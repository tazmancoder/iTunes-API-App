//
//  AlbumSearchView.swift
//  iTunes Seach
//
//  Created by Mark Perryman on 8/10/22.
//

import SwiftUI

struct AlbumSearchView: View {
    @StateObject var vm = AlbumListViewModel()
    
    var body: some View {
        NavigationView {
            Group {
                if vm.searchTerm.isEmpty {
                    SearchPlaceholderView(searchTerm: $vm.searchTerm)
                } else {
                    AlbumListView(vm: vm)
                }
            }
            .searchable(text: $vm.searchTerm)
            .navigationTitle("Search Albums")
        }
    }
}

struct AlbumSearchView_Previews: PreviewProvider {
    static var previews: some View {
        AlbumSearchView()
    }
}
