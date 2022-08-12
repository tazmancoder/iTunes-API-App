//
//  MovieListView.swift
//  iTunes Seach
//
//  Created by Mark Perryman on 8/10/22.
//

import SwiftUI

struct MovieListView: View {
    @ObservedObject var vm = MovieListViewModel()
    
    var body: some View {
        List {
            ForEach(vm.movies) { movie in
                MovieRowView(movie: movie)
            }
            
            ListPlaceholderRowView(state: vm.state, loadMore: vm.loadMore)
        }
        .listStyle(.plain)
    }
}

struct MovieListView_Previews: PreviewProvider {
    static var previews: some View {
        MovieListView()
    }
}
