//
//  SettingsView.swift
//  RagaFinder
//
//  Created by Rakshay Narayanan on 6/24/23.
//

import SwiftUI

struct SettingsView: View {
    
    @AppStorage("pitch") var pitch: Pitch = .C
    
    var body: some View {
        
        NavigationView {
            ZStack {
                bgColor
                    .ignoresSafeArea()
                
                VStack {
                    Form {
                        Section(header: Text("Music")) {
                            Picker("Pitch", selection: $pitch) {
                                ForEach(Pitch.allCases) { option in
                                    Text(option.rawValue.capitalized)
                                }
                            }
                        }
                        Section(header: Text("Information")) {
                            HStack {
                                Image(systemName: "staroflife.fill")
                                Text("=  Melakarta Ragam")
                            }
                        }
                    }
                    .scrollContentBackground(.hidden)
                }
            }
            .onChange(of: pitch) { newPitch in
                NoteConversions()
            }
            .navigationTitle("Settings")
            .preferredColorScheme(.dark)
        }
        .navigationViewStyle(.stack)
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}

enum Pitch: String, CaseIterable, Identifiable {
    var id: Self {
        return self
    }
    
    case C
    case Db
    case D
    case Eb
    case E
    case F
    case Gb
    case G
    case Ab
    case A
    case Bb
    case B
    // TODO: add pitches in later versions
}
