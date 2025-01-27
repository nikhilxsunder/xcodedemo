//
//  ContentView.swift
//  test
//
//  Created by Nikhil Sunder on 1/23/25.
//

import SwiftUI

struct MainView: View
{
    var body: some View
    {
        VStack
        {
            Text("Dashboard").font(.largeTitle).padding()
            NavigationStack
            {
                HStack
                {
                    NavigationLink(destination: ChartView())
                    {
                        VStack
                        {
                            Image("DashChartIcon")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 100, height: 100)
                            Text("Chart")
                        }
                    }
                    NavigationLink(destination: NewsView())
                    {
                        VStack
                        {
                            Image("NewsIcon")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 100, height: 100)
                            Text("News")
                        }
                    }
                }
            }
        }
        .padding()
    }
}

#Preview
{
    MainView()
}
