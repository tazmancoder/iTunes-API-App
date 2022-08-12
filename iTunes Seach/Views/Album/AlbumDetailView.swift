//
//  AlbumDetailView.swift
//  iTunes Seach
//
//  Created by Mark Perryman on 8/12/22.
//

import SwiftUI

struct AlbumDetailView: View {
    @StateObject var songsVM: SongsForAlbumListViewModel

    let album: Album
    
    init(album: Album) {
        print("Init Album Detail \(album.id)")
        self.album = album
        _songsVM = StateObject(wrappedValue: SongsForAlbumListViewModel(albumID: album.id))
    }
    
    var body: some View {
        VStack {
            HStack(alignment: .bottom) {
                ImageLoadingView(urlString: album.artworkUrl100, size: 100)
                
                VStack(alignment: .leading) {
                    Text(album.collectionName)
                        .foregroundColor(.black)
                        .font(.body)
                    Text(album.artistName)
                        .padding(.bottom, 5)
                    
                    Text(album.primaryGenreName)
                    Text("\(album.trackCount) songs")
                    Text("Released: \(formatDate(value: album.releaseDate))")
                }
                .font(.caption)
                .foregroundColor(.gray)
                .lineLimit(1)
               
                Spacer(minLength: 20)
                BuyButton(urlString: album.collectionViewURL,
                          price: album.collectionPrice,
                          currency: album.currency)
                
            }
            .padding()
            
            SongsForAlbumListView(songsVM: songsVM)
        }
        .onAppear {
            songsVM.fetch()
        }
    }
    
    func formatDate(value: String) -> String {
        let dfGet = DateFormatter()
        dfGet.dateFormat = "yyyy-MM-dd'T'HH:mm:ss'Z'"
        
        guard let date = dfGet.date(from: value) else { return "" }
        
        let dfSet = DateFormatter()
        dfSet.locale = Locale.current
        dfSet.dateStyle = .medium
        dfSet.timeStyle = .none
        return dfSet.string(from: date)
    }
}

struct AlbumDetailView_Previews: PreviewProvider {
    static var previews: some View {
        AlbumDetailView(album: Album.example())
    }
}
