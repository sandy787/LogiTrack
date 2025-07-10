//
//  LogiTrackApp.swift
//  LogiTrack
//
//  Created by prajwal sanap on 09/07/25.
//

import SwiftUI
import FirebaseCore

@main
struct LogiTrackApp: App {
    init() {
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
