//
//  Settings.swift
//  RagaFinder
//
//  Created by Rakshay Narayanan on 6/18/23.
//

import SwiftUI

struct Settings: View {
    var body: some View {
        ZStack {
            Color(.black)
                .ignoresSafeArea()
            VStack {
                Image(systemName: "gearshape")
                    .foregroundColor(.white)
                Text("This is your settings page.")
                    .foregroundColor(.white)
            }
        }
    }
}

struct Settings_Previews: PreviewProvider {
    static var previews: some View {
        Settings()
    }
}
