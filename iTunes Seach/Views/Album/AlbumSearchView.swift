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
                    AlbumPlaceholderView(searchTerm: $vm.searchTerm)
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

struct AlbumPlaceholderView: View {
    @Binding var searchTerm: String
    let suggestions = ["Country", "Heavy Metal", "Jazz", "Soft Rock"]

    var body: some View {
        VStack {
            Text("Search Suggestions")
                .font(.title)
                .padding(20)
            
            ForEach(suggestions, id: \.self) { text in
                Button(action: { searchTerm = text }, label: {
                    Text(text)
                        .font(.title2)
                })
            }
            
            Spacer()
        }
    }
}
