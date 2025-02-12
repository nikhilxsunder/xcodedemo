//
//  ChartUIProperties.swift
//  test
//
//  Created by Nikhil Sunder on 1/24/25.
//

import Foundation

// Source Property
enum Source: String, CaseIterable, Identifiable
{
    case binanceUS
    var id: Self
    {
        self
    }
}

// Ticker Property
enum Ticker: String, CaseIterable, Identifiable
{
    case btcusdt = "BTCUSDT"
    case ethusdt = "ETHUSDT"
    var id: Self 
    {
        self
    }
}

// Kline Interval Property
enum KlineInterval: String, CaseIterable, Identifiable
{
    case oneMinute = "1m"
    case oneHour = "1h"
    case oneDay = "1d"
    case oneWeek = "1w"
    case oneMonth = "1M"
    var id: Self
    {
        self
    }
} 

