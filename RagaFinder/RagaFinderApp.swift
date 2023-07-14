//
//  RagaFinderApp.swift
//  RagaFinder
//
//  Created by Rakshay Narayanan on 6/11/23.
//

import SwiftUI

@main
struct RagaFinderApp: App {
    
    init() {
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor : UIColor.white]
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
