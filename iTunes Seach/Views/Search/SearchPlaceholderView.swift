//
//  SearchPlaceholderView.swift
//  iTunes Seach
//
//  Created by Mark Perryman on 8/11/22.
//

import SwiftUI

struct SearchPlaceholderView: View {
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

struct SearchPlaceholderView_Previews: PreviewProvider {
    static var previews: some View {
        SearchPlaceholderView(searchTerm: .constant("John"))
    }
}
