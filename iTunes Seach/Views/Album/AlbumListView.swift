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
                NavigationLink(destination: AlbumDetailView(album: album)) {
                    AlbumRowView(album: album)
                }
            }
            
            switch vm.state {
            case .good:
                Color.clear
                    .onAppear {
                        vm.loadMore()
                    }
            case .isLoading:
                ProgressView()
                    .progressViewStyle(.circular)
                    .frame(maxWidth: .infinity)
            case .loadedAll:
                Text("No more results found")
                    .font(.title2)
                    .foregroundColor(.red)
            case .error(let message):
                Text(message)
                    .foregroundColor(.red)
            }
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

