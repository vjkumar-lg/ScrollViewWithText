//
//  ScrollView2App.swift
//  ScrollView2
//
//  Created by vijay-pt5416 on 17/06/22.
//

import SwiftUI

@main
struct ScrollView2App: App {
    var body: some Scene {
        WindowGroup {
            ContentView(acceptButton: AcceptButton(), declineButton: DeclineButton())
        }
    }
}
