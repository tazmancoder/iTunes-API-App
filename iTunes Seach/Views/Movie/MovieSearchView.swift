//
//  MovieSearchView.swift
//  iTunes Seach
//
//  Created by Mark Perryman on 8/10/22.
//

import SwiftUI

struct MovieSearchView: View {
    @StateObject var vm = MovieListViewModel()
    
    var body: some View {
        NavigationView {
            Group {
                if vm.movies.isEmpty {
                    MoviePlaceholderView(searchTerm: $vm.searchTerm)
                } else {
                    MovieListView(vm: vm)
                }
            }
            .searchable(text: $vm.searchTerm)
            .navigationTitle("Search Movies")
        }
    }
}

struct MovieSearchView_Previews: PreviewProvider {
    static var previews: some View {
        MovieSearchView()
    }
}

struct MoviePlaceholderView: View {
    @Binding var searchTerm: String
    let suggestions = ["Fletch", "Dune", "Mission Impossible", "Top Gun"]

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
