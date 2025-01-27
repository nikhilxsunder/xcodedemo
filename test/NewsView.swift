//
//  NewsView.swift
//  test
//
//  Created by Nikhil Sunder on 1/24/25.
//

import SwiftUI

struct NewsView: View
{
    @State private var selectedNewsFeed: NewsFeed = NewsFeed.cryptoNews
    var body: some View
    {
        VStack
        {
            Text("News").font(.title).padding()
            HStack
            {
                Picker("NewsFeed", selection: $selectedNewsFeed)
                {
                    Text("CryptoNews").tag(NewsFeed.cryptoNews)
                }
            }
        }
    }
}

#Preview {
    NewsView()
}
