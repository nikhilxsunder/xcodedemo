//
//  ChartFunctions.swift
//  test
//
//  Created by Nikhil Sunder on 1/24/25.
//

import Foundation

// Fetch Kline Data
func fetchKlineData(symbol: String, interval: KlineInterval, limit: Int = 500, completion: @escaping (Result<[[Any]], Error>) -> Void)
{
    let baseUrl = "https://api.binance.us/api/v3/klines"
    var urlComponents = URLComponents(string: baseUrl)!
    urlComponents.queryItems = [
        URLQueryItem(name: "symbol", value: symbol),
        URLQueryItem(name: "interval", value: interval.rawValue),
        URLQueryItem(name: "limit", value: String(limit))
    ]
    guard let url = urlComponents.url
    else
    {
        completion(.failure(NSError(domain: "Invalid URL", code: 0, userInfo: nil)))
        return
    }
    var request = URLRequest(url: url)
    request.httpMethod = "GET"
    
    let task = URLSession.shared.dataTask(with: request)
    {
        data, response, error in if let error = error
        {
            completion(.failure(error))
            return
        }
        guard let data = data
        else
        {
            completion(.failure(NSError(domain: "No Data Received", code: 0, userInfo: nil)))
            return
        }
        do
        {
            if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [[Any]]
            {
                completion(.success(json))
            }
            else
            {
                completion(.failure(NSError(domain: "Invalid JSON format", code: 0, userInfo: nil)))
            }
        }
        catch
        {
            completion(.failure(error))
        }
    }
    task.resume()
}

// Fetch Ticker Data
func fetchExchangeInfo(completion: @escaping ([String]) -> Void)
{
    let urlString = "https://api.binance.us/api/v3/exchangeInfo"
    guard let url = URL(string: urlString) else
    {
        print("Invalid URL")
        completion([])
        return
    }
    let task = URLSession.shared.dataTask(with: url)
    {
        data, response, error in
        if let error = error
        {
            print("Error fetching symbols: \(error.localizedDescription)")
            completion([])
            return
        }
        guard let data = data else
        {
            print("No data received")
            completion([])
            return
        }
        do
        {
            print("Received data: \(String(data: data, encoding: .utf8) ?? "Invalid Data")")
            let exchangeInfo = try JSONDecoder().decode(ExchangeInfo.self, from: data)
            DispatchQueue.main.async
            {
                let symbols = exchangeInfo.symbols.map
                {
                    $0.symbol
                }
                print("Symbols Loaded: \(symbols)")
                completion(symbols)
            }
        }
        catch
        {
            print("Failed to decode JSON: \(error)")
            completion([])
        }
    }
    task.resume()
}


