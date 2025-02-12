//
//  ContentView.swift
//  test
//
//  Created by Nikhil Sunder on 1/23/25.
//

import SwiftUI

struct MenuView: View
{
    var body: some View
    {
        VStack
        {
            Text("Dashboard").font(.largeTitle).padding()
            NavigationStack
            {
                VStack
                {
                    HStack
                    {
                        NavigationLink(destination: ChartView())
                        {
                            VStack
                            {
                                Image("ChartIcon")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 100, height: 100)
                                Text("Chart")
                            }
                        }.padding()
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
                        }.padding()
                    }
                    HStack
                    {
                        NavigationLink(destination: CalendarView())
                        {
                            VStack
                            {
                                Image("CalendarIcon")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 100, height: 100)
                                Text("Calendar")
                            }
                        }.padding()
                    }
                }
            }
        }
        .padding()
    }
}

#Preview
{
    MenuView()
}
