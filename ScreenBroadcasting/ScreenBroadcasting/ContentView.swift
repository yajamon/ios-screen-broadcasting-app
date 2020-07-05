//
//  ContentView.swift
//  ScreenBroadcasting
//
//  Created by Yajamon on 2020/06/21.
//  Copyright © 2020 Yajamon. All rights reserved.
//

import SwiftUI
import ReplayKit

struct ContentView: View {
    var body: some View {
        VStack {
            Text("Hello, World!")
            Spacer()
            HStack {
                Button("Recording") {
                    RPScreenRecorder.shared().startRecording(handler: nil)
                }
                Spacer()
                Button("RecStop") {
                    RPScreenRecorder.shared().stopRecording { (preview, error) in
                        guard error == nil && preview != nil else {
                            return
                        }

                        preview?.modalPresentationStyle = .fullScreen
                        let scene = UIApplication.shared.connectedScenes.first as! UIWindowScene
                        scene.windows.last?.rootViewController?.present(preview!, animated: true, completion: nil)
                    }
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
