//
//  NewsUIProperties.swift
//  test
//
//  Created by Nikhil Sunder on 1/25/25.
//

import Foundation

// Source Property
enum NewsFeed: String, CaseIterable, Identifiable
{
    case cryptoNews = "cryptoNews"
    var id: Self
    {
        self
    }
}
