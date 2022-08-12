//
//  SongsForAlbumListView.swift
//  iTunes Seach
//
//  Created by Mark Perryman on 8/12/22.
//

import SwiftUI

struct SongsForAlbumListView: View {
    @ObservedObject var songsVM: SongsForAlbumListViewModel
    
    var body: some View {
        ScrollView {
            if songsVM.state == .isLoading {
                ProgressView()
                    .progressViewStyle(.circular)
            } else {
                #warning("Make Changes to use Grid once the new Xcode comes out")
                // When using iOS 16 use replace VStack with Grid
//                Grid(horizontalSpacing: 20) {
                VStack(alignment: .leading, spacing: 20) {
                    ForEach(songsVM.songs) { song in
                        // When using iOS 16 replace HStack with GridRow
//                        GridRow {
                        HStack {
                            Text("\(song.trackNumber).")
                                .font(.footnote)
                            // When using iOS 16 replace frame with .gridColumnAlignment
//                                .gridColumnAlignment(.tailing)
                                .frame(width: 25, alignment: .trailing)
                            
                            Text(song.trackName)
//                                .gridColumnAlignment(.tailing)

                            Spacer()
                            Text(formatTime(time: song.trackTimeMillis))
                                .font(.footnote)
                            // When using iOS 16 remove the frame from here
                                .frame(width: 50, alignment: .center)

                            BuySongButton(urlString: song.previewURL, price: song.trackPrice, currency: song.currency)
                        }
                        Divider()
                    }
                }
                .padding([.vertical, .trailing])
            }
        }
    }
    
    func formatTime(time: Int) -> String {
        let timeInSeconds = time / 1000
        let interval = TimeInterval(timeInSeconds)
        let df = DateComponentsFormatter()
        
        df.zeroFormattingBehavior = .pad
        df.allowedUnits = [.minute, .second]
        df.unitsStyle = .positional
        
        return df.string(from: interval) ?? ""
    }
}

//struct SongsForAlbumListView_Previews: PreviewProvider {
//    static var previews: some View {
//        SongsForAlbumListView(songsVM: SongsForAlbumListViewModel.example())
//    }
//}
