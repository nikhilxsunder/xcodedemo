//
//  ChartView.swift
//  test
//
//  Created by Nikhil Sunder on 1/23/25.
//

import SwiftUI
import Charts
import Foundation

// ChartView
struct ChartView: View
{
    @State private var selectedSource: Source = Source.binanceUS
    @State private var selectedTicker: Ticker = Ticker.btcusdt
    @State private var selectedInterval: KlineInterval = KlineInterval.oneDay
    @State private var klineData: [KlineData] = []
    
    // UI Elements
    var body: some View
    {
        VStack
        {
            
            // Chart Properties
            Text("Chart").font(.largeTitle).padding()
            HStack
            {
                VStack
                {
                    Text("Source").font(.headline)
                    Picker("Source", selection: $selectedSource)
                    {
                        Text("Binance US").tag(Source.binanceUS)
                    }
                }
                VStack
                {
                    Text("Symbol").font(.headline)
                    Picker("Symbol", selection: $selectedTicker)
                    {
                        Text("BTC").tag(Ticker.btcusdt)
                    }
                }
                VStack
                {
                    Text("Interval").font(.headline)
                    Picker("Interval", selection: $selectedInterval)
                    {
                        ForEach(KlineInterval.allCases)
                        {
                            interval in
                            Text(interval.rawValue).tag(interval)
                        }
                    }
                }
            }
            
            // Chart Element
            if klineData.isEmpty
            {
                Text("Loading data...").onAppear
                {
                    fetchKlineData(symbol: selectedTicker.rawValue, interval: selectedInterval, completion:
                    {
                        result in switch result
                        {
                        case .success(let klineData):
                            DispatchQueue.main.async
                            {
                                self.klineData = klineData.map
                                {
                                    kline in KlineData(
                                        openTime: kline[0] as? Int ?? 0,
                                        open: Double(kline[1] as? String ?? "0") ?? 0.0,
                                        high: Double(kline[2] as? String ?? "0") ?? 0.0,
                                        low: Double(kline[3] as? String ?? "0") ?? 0.0,
                                        close: Double(kline[4] as? String ?? "0") ?? 0.0,
                                        volume: Double(kline[5] as? String ?? "0") ?? 0.0
                                    )
                                }.reversed()
                            }
                        case .failure(let error):
                            print("Error fetching kline data: \(error)")
                        }
                    })
                }
            }
            else
            {
                VStack
                {
                    HStack
                    {
                        let lastKline = klineData.last!
                        VStack
                        {
                            Text("Open:").font(.caption)
                            Text(String(format: "%.2f",lastKline.open)).font(.caption2)
                        }
                        VStack
                        {
                            Text("Close:").font(.caption)
                            Text(String(format: "%.2f",lastKline.close)).font(.caption2)
                        }
                        VStack
                        {
                            Text("High:").font(.caption)
                            Text(String(format: "%.2f",lastKline.high)).font(.caption2)
                        }
                        VStack
                        {
                            Text("Low:").font(.caption)
                            Text(String(format: "%.2f",lastKline.low)).font(.caption2)
                        }
                        VStack
                        {
                            Text("Volume:").font(.caption)
                            Text(String(format: "%.2f",lastKline.volume)).font(.caption2)
                        }
                    }
                    CandlestickChartView(klineData: klineData)
                    VolumeChartView(klineData: klineData)
                }
            }
        }
        .padding()
        .onChange(of: selectedInterval)
        {
            [selectedInterval] in fetchKlineData(symbol: selectedTicker.rawValue, interval: selectedInterval, completion:
            {
                result in switch result
                {
                    case .success(let klineData):
                        DispatchQueue.main.async
                    {
                        self.klineData = klineData.map
                        {
                            kline in KlineData(
                                openTime: kline[0] as? Int ?? 0,
                                open: Double(kline[1] as? String ?? "0") ?? 0.0,
                                high: Double(kline[2] as? String ?? "0") ?? 0.0,
                                low: Double(kline[3] as? String ?? "0") ?? 0.0,
                                close: Double(kline[4] as? String ?? "0") ?? 0.0,
                                volume: Double(kline[5] as? String ?? "0") ?? 0.0
                            )
                        }.reversed()
                    }
                    case .failure(let error):
                        print("Error fetching kline data: \(error)")
                }
            })
        }
    }
}


#Preview {
    ChartView()
}
