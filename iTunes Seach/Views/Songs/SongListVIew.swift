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
                Text(song.trackName)
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

struct SongListVIew_Previews: PreviewProvider {
    static var previews: some View {
        SongListVIew(vm: SongListViewModel())
    }
}
