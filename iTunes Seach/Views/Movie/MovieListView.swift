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
                    EmptyView()
                case .error(let message):
                    Text(message)
                        .foregroundColor(.pink)
            }
        }
        .listStyle(.plain)
    }
}

struct MovieListView_Previews: PreviewProvider {
    static var previews: some View {
        MovieListView()
    }
}
