//
//  ARMenuAppApp.swift
//  ARMenuApp
//
//  Created by Yemmanuru, Krishna Saimahith on 7/15/24.
//
import SwiftUI
import Firebase

@main
struct ARMenuAppApp: App {
    init() {
        FirebaseApp.configure()
    }

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

