//
//  ChartObjects.swift
//  test
//
//  Created by Nikhil Sunder on 2/12/25.
//

import Foundation

// Symbol Loader Class
class SymbolLoader: ObservableObject
{
    @Published var symbols: [String] = []
    @Published var selectedSymbol: String = "BTCUSDT"
    
    init()
    {
        loadSymbols()
    }
    
    func loadSymbols()
    {
        fetchExchangeInfo
        {
            fetchedSymbols in
            DispatchQueue.main.async
            {
                self.symbols = fetchedSymbols
                if let firstSymbol = fetchedSymbols.first
                {
                    self.selectedSymbol = firstSymbol
                }
            }
        }
    }
}
