//
//  ChartDataModels.swift
//  test
//
//  Created by Nikhil Sunder on 1/24/25.
//

import Foundation

// Kline Data Model
struct KlineData: Identifiable
{
    let id = UUID()
    let openTime: Date
    let open: Double
    let high: Double
    let low: Double
    let close: Double
    let volume: Double
    
    init(openTime: Int, open: Double, high: Double, low: Double, close: Double, volume: Double) {
        self.openTime = Date(timeIntervalSince1970: TimeInterval(openTime / 1000))
        self.open = open
        self.high = high
        self.low = low
        self.close = close
        self.volume = volume
    }
}
