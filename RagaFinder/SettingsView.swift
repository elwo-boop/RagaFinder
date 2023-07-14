//
//  SettingsView.swift
//  RagaFinder
//
//  Created by Rakshay Narayanan on 6/24/23.
//

import SwiftUI

struct SettingsView: View {
    
    @AppStorage("instrument") private var instrument: Instrument = .piano
    
    var body: some View {
        NavigationView {
            ZStack {
                bgColor
                    .ignoresSafeArea()
                
                VStack {
                    Form {
                        Picker("Instrument", selection: $instrument) {
                            ForEach(Instrument.allCases) { option in
                                Text(option.rawValue.capitalized)
                            }
                        }
                        Text("More instruments coming soon!")
                            .bold()
                            
                    }
                    .scrollContentBackground(.hidden)
                }
            }
            .navigationTitle("Settings")
            .preferredColorScheme(.dark)
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}

enum Instrument: String, CaseIterable, Identifiable {
    var id: Self {
        return self
    }
    
    case piano
    // TODO: add instruments in later versions
}
