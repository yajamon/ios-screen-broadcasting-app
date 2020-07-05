//
//  ContentView.swift
//  ScreenBroadcasting
//
//  Created by Yajamon on 2020/06/21.
//  Copyright © 2020 Yajamon. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Text("Hello, World!")
            Spacer()
            HStack {
                Button("Recording") {
                }
                Spacer()
                Button("RecStop") {
                }
            }
        }.padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
