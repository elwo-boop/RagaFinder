//
//  ContentView.swift
//  RagaFinder
//
//  Created by Rakshay Narayanan on 6/11/23.
//

import SwiftUI

struct ContentView: View {
    
    // TODO: ADD LOWER M2 AND M1
    
    var body: some View {
        GeometryReader { geo in
            
            // screen dimensions
            let screenWidth: CGFloat = geo.size.width
            let screenHeight: CGFloat = geo.size.height
            
            TabView {
                RagaBuilder(screenWidth: screenWidth, screenHeight: screenHeight)
                    .tabItem {
                        Label("Find My Raga", systemImage: "music.quarternote.3")
                    }
                RagaList(screenWidth: screenWidth, screenHeight: screenHeight)
                    .tabItem {
                        Label("Raga List", systemImage: "music.note")
                    }
                SettingsView()
                    .tabItem {
                        Label("Settings", systemImage: "gearshape")
                    }
            }
            .onAppear {
                NoteConversions()
                let appearance = UITabBarAppearance()
                appearance.backgroundEffect = UIBlurEffect(style: .systemUltraThinMaterial)
                appearance.backgroundColor = UIColor(bgColor.opacity(0.2))
                
                // Use this appearance when scrolling behind the TabView:
                UITabBar.appearance().standardAppearance = appearance
                // Use this appearance when scrolled all the way up:
                UITabBar.appearance().scrollEdgeAppearance = appearance
            }
            .tint(.blue)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
