//
//  MovieRowView.swift
//  iTunes Seach
//
//  Created by Mark Perryman on 8/11/22.
//

import SwiftUI

struct MovieRowView: View {
    
    let movie: Movie
    
    var body: some View {
        HStack {
            ImageLoadingView(urlString: movie.artworkUrl100, size: 100)
            
            VStack(alignment: .leading) {
                Text(movie.trackName)
                Text(movie.primaryGenreName)
                    .foregroundColor(.gray)
                Text(movie.releaseDate)
                    
            }
            .font(.caption)
            
            Spacer(minLength: 20)
          
            BuyButton(urlString: movie.previewURL ?? "",
                      price: movie.trackPrice,
                      currency: movie.currency)
        }
    }
}

struct MovieRowView_Previews: PreviewProvider {
    static var previews: some View {
        MovieRowView(movie: Movie.example())
    }
}
