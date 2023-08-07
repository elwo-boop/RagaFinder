//
//  RagaBuilder.swift
//  RagaFinder
//
//  Created by Rakshay Narayanan on 6/18/23.
//

import SwiftUI
import AVFoundation

var playerQueue: AVQueuePlayer!
var audioPlayer: AVAudioPlayer!
var bgColor = Color(red: 0.101, green: 0.0901, blue: 0.0901)

var noteConversions: [String : String] = [
    ".M1": ".F",
    ".M2": ".Gb",
    ".P": ".G",
    ".D1": ".Ab",
    ".D2": ".A",
    ".N1": ".A",
    ".D3": ".Bb",
    ".N2": ".Bb",
    ".N3": ".B",
    "S": "C",
    "R1": "Db",
    "R2": "D",
    "G1": "D",
    "R3": "Eb",
    "G2": "Eb",
    "G3": "E",
    "M1": "F",
    "M2": "Gb",
    "P": "G",
    "D1": "Ab",
    "D2": "A",
    "N1": "A",
    "D3": "Bb",
    "N2": "Bb",
    "N3": "B",
    "S.": "C.",
    "R1.": "Db.",
    "R2.": "D.",
    "G1.": "D.",
    "R3.": "Eb.",
    "G2.": "Eb.",
    "G3.": "E"
]

struct NoteConversions {
    @AppStorage("pitch") var pitch: Pitch!

    init() {
        if (pitch == Pitch.C) {
            noteConversions = [
                ".M1": ".F",
                ".M2": ".Gb",
                ".P": ".G",
                ".D1": ".Ab",
                ".D2": ".A",
                ".N1": ".A",
                ".D3": ".Bb",
                ".N2": ".Bb",
                ".N3": ".B",
                "S": "C",
                "R1": "Db",
                "R2": "D",
                "G1": "D",
                "R3": "Eb",
                "G2": "Eb",
                "G3": "E",
                "M1": "F",
                "M2": "Gb",
                "P": "G",
                "D1": "Ab",
                "D2": "A",
                "N1": "A",
                "D3": "Bb",
                "N2": "Bb",
                "N3": "B",
                "S.": "C.",
                "R1.": "Db.",
                "R2.": "D.",
                "G1.": "D.",
                "R3.": "Eb.",
                "G2.": "Eb.",
                "G3.": "E."
            ]
        }
        if (pitch == Pitch.Db) {
            noteConversions = [
                ".M1": ".Gb",
                ".M2": ".G",
                ".P": ".Ab",
                ".D1": ".A",
                ".D2": ".Bb",
                ".N1": ".Bb",
                ".D3": ".B",
                ".N2": ".B",
                ".N3": "C",
                "S": "Db",
                "R1": "D",
                "R2": "Eb",
                "G1": "Eb",
                "R3": "E",
                "G2": "E",
                "G3": "F",
                "M1": "Gb",
                "M2": "G",
                "P": "Ab",
                "D1": "A",
                "D2": "Bb",
                "N1": "Bb",
                "D3": "B",
                "N2": "B",
                "N3": "C.",
                "S.": "Db.",
                "R1.": "D.",
                "R2.": "Eb.",
                "G1.": "Eb.",
                "R3.": "E.",
                "G2.": "E.",
                "G3.": "F."
            ]
        }
        if (pitch == Pitch.D) {
            noteConversions = [
                ".M1": ".G",
                ".M2": ".Ab",
                ".P": ".A",
                ".D1": ".Bb",
                ".D2": ".B",
                ".N1": ".B",
                ".D3": "C",
                ".N2": "C",
                ".N3": "Db",
                "S": "D",
                "R1": "Eb",
                "R2": "E",
                "G1": "E",
                "R3": "F",
                "G2": "F",
                "G3": "Gb",
                "M1": "G",
                "M2": "Ab",
                "P": "A",
                "D1": "Bb",
                "D2": "B",
                "N1": "B",
                "D3": "C.",
                "N2": "C.",
                "N3": "Db.",
                "S.": "D.",
                "R1.": "Eb.",
                "R2.": "E.",
                "G1.": "E.",
                "R3.": "F.",
                "G2.": "F.",
                "G3.": "Gb."
            ]
        }
        if (pitch == Pitch.Eb) {
            noteConversions = [
                ".M1": ".Ab",
                ".M2": ".A",
                ".P": ".Bb",
                ".D1": ".B",
                ".D2": "C",
                ".N1": "C",
                ".D3": "Db",
                ".N2": "Db",
                ".N3": "D",
                "S": "Eb",
                "R1": "E",
                "R2": "F",
                "G1": "F",
                "R3": "Gb",
                "G2": "Gb",
                "G3": "G",
                "M1": "Ab",
                "M2": "A",
                "P": "Bb",
                "D1": "B",
                "D2": "C.",
                "N1": "C.",
                "D3": "Db.",
                "N2": "Db.",
                "N3": "D.",
                "S.": "Eb.",
                "R1.": "E.",
                "R2.": "F.",
                "G1.": "F.",
                "R3.": "Gb.",
                "G2.": "Gb.",
                "G3.": "G."
            ]
        }
        if (pitch == Pitch.E) {
            noteConversions = [
                ".M1": ".A",
                ".M2": ".Bb",
                ".P": ".B",
                ".D1": "C",
                ".D2": "Db",
                ".N1": "Db",
                ".D3": "D",
                ".N2": "D",
                ".N3": "Eb",
                "S": "E",
                "R1": "F",
                "R2": "Gb",
                "G1": "Gb",
                "R3": "G",
                "G2": "G",
                "G3": "Ab",
                "M1": "A",
                "M2": "Bb",
                "P": "B",
                "D1": "C.",
                "D2": "Db.",
                "N1": "Db.",
                "D3": "D.",
                "N2": "D.",
                "N3": "Eb.",
                "S.": "E.",
                "R1.": "F.",
                "R2.": "Gb.",
                "G1.": "Gb.",
                "R3.": "G.",
                "G2.": "G.",
                "G3.": "Ab."
            ]
        }
        if (pitch == Pitch.F) {
            noteConversions = [
                ".M1": ".Bb",
                ".M2": ".B",
                ".P": "C",
                ".D1": "Db",
                ".D2": "D",
                ".N1": "D",
                ".D3": "Eb",
                ".N2": "Eb",
                ".N3": "E",
                "S": "F",
                "R1": "Gb",
                "R2": "G",
                "G1": "G",
                "R3": "Ab",
                "G2": "A",
                "G3": "A",
                "M1": "Bb",
                "M2": "B",
                "P": "C.",
                "D1": "Db.",
                "D2": "D.",
                "N1": "D.",
                "D3": "Eb.",
                "N2": "Eb.",
                "N3": "E.",
                "S.": "F.",
                "R1.": "Gb.",
                "R2.": "G.",
                "G1.": "G.",
                "R3.": "Ab.",
                "G2.": "Ab.",
                "G3.": "A."
            ]
        }
        if (pitch == Pitch.Gb) {
            noteConversions = [
                ".M1": ".B",
                ".M2": "C",
                ".P": "Db",
                ".D1": "D",
                ".D2": "Eb",
                ".N1": "Eb",
                ".D3": "E",
                ".N2": "E",
                ".N3": "F",
                "S": "Gb",
                "R1": "G",
                "R2": "Ab",
                "G1": "Ab",
                "R3": "A",
                "G2": "A",
                "G3": "Bb",
                "M1": "B",
                "M2": "C.",
                "P": "Db.",
                "D1": "D.",
                "D2": "Eb.",
                "N1": "Eb.",
                "D3": "E.",
                "N2": "E.",
                "N3": "F.",
                "S.": "Gb.",
                "R1.": "G.",
                "R2.": "Ab.",
                "G1.": "Ab.",
                "R3.": "A.",
                "G2.": "A.",
                "G3.": "Bb."
            ]
        }
        if (pitch == Pitch.G) {
            noteConversions = [
                ".M1": "C",
                ".M2": "Db",
                ".P": "D",
                ".D1": "Eb",
                ".D2": "E",
                ".N1": "E",
                ".D3": "F",
                ".N2": "F",
                ".N3": "Gb",
                "S": "G",
                "R1": "Ab",
                "R2": "A",
                "G1": "A",
                "R3": "Bb",
                "G2": "Bb",
                "G3": "B",
                "M1": "C.",
                "M2": "Db.",
                "P": "D.",
                "D1": "Eb.",
                "D2": "E.",
                "N1": "E.",
                "D3": "F.",
                "N2": "F.",
                "N3": "Gb.",
                "S.": "G.",
                "R1.": "Ab.",
                "R2.": "A.",
                "G1.": "A.",
                "R3.": "Bb.",
                "G2.": "Bb.",
                "G3.": "B."
            ]
        }
        if (pitch == Pitch.Ab) {
            noteConversions = [
                ".M1": "Db",
                ".M2": "D",
                ".P": "Eb",
                ".D1": "E",
                ".D2": "F",
                ".N1": "F",
                ".D3": "Gb",
                ".N2": "Gb",
                ".N3": "G",
                "S": "Ab",
                "R1": "A",
                "R2": "Bb",
                "G1": "Bb",
                "R3": "B",
                "G2": "B",
                "G3": "C.",
                "M1": "Db.",
                "M2": "D.",
                "P": "Eb.",
                "D1": "E.",
                "D2": "F.",
                "N1": "F.",
                "D3": "Gb.",
                "N2": "Gb.",
                "N3": "G.",
                "S.": "Ab.",
                "R1.": "A.",
                "R2.": "Bb.",
                "G1.": "Bb.",
                "R3.": "B.",
                "G2.": "B.",
                "G3.": "C.."
            ]
        }
        if (pitch == Pitch.A) {
            noteConversions = [
                ".M1": "D",
                ".M2": "Eb",
                ".P": "E",
                ".D1": "F",
                ".D2": "Gb",
                ".N1": "Gb",
                ".D3": "G",
                ".N2": "G",
                ".N3": "Ab",
                "S": "A",
                "R1": "Bb",
                "R2": "B",
                "G1": "B",
                "R3": "C.",
                "G2": "C.",
                "G3": "Db.",
                "M1": "D.",
                "M2": "Eb.",
                "P": "E.",
                "D1": "F.",
                "D2": "Gb.",
                "N1": "Gb.",
                "D3": "G.",
                "N2": "G.",
                "N3": "Ab.",
                "S.": "A.",
                "R1.": "Bb.",
                "R2.": "B.",
                "G1.": "B.",
                "R3.": "C..",
                "G2.": "C..",
                "G3.": "Db.."
            ]
        }
        if (pitch == Pitch.Bb) {
            noteConversions = [
                ".M1": "Eb",
                ".M2": "E",
                ".P": "F",
                ".D1": "Gb",
                ".D2": "G",
                ".N1": "G",
                ".D3": "Ab",
                ".N2": "Ab",
                ".N3": "A",
                "S": "Bb",
                "R1": "B",
                "R2": "C.",
                "G1": "C.",
                "R3": "Db.",
                "G2": "Db.",
                "G3": "D.",
                "M1": "Eb.",
                "M2": "E.",
                "P": "F.",
                "D1": "Gb.",
                "D2": "G.",
                "N1": "G.",
                "D3": "Ab.",
                "N2": "Ab.",
                "N3": "A.",
                "S.": "Bb.",
                "R1.": "B.",
                "R2.": "C..",
                "G1.": "C..",
                "R3.": "Db..",
                "G2.": "Db..",
                "G3.": "D.."
            ]
        }
        if (pitch == Pitch.B) {
            noteConversions = [
                ".M1": "E",
                ".M2": "F",
                ".P": "Gb",
                ".D1": "G",
                ".D2": "Ab",
                ".N1": "Ab",
                ".D3": "A",
                ".N2": "A",
                ".N3": "Bb",
                "S": "B",
                "R1": "C.",
                "R2": "Db.",
                "G1": "Db.",
                "R3": "D.",
                "G2": "D.",
                "G3": "Eb.",
                "M1": "E.",
                "M2": "F.",
                "P": "Gb.",
                "D1": "G.",
                "D2": "Ab.",
                "N1": "Ab.",
                "D3": "A.",
                "N2": "A.",
                "N3": "Bb.",
                "S.": "B.",
                "R1.": "C..",
                "R2.": "Db..",
                "G1.": "Db..",
                "R3.": "D..",
                "G2.": "D..",
                "G3.": "E.."
            ]
        }
    }
}


struct RagaBuilder: View {
    
    let screenWidth: CGFloat
    let screenHeight: CGFloat
    
    @State private var C: Bool = false
    @State private var Db: Bool = false
    @State private var D: Bool = false
    @State private var Eb: Bool = false
    @State private var E: Bool = false
    @State private var F: Bool = false
    @State private var Gb: Bool = false
    @State private var G: Bool = false
    @State private var Ab: Bool = false
    @State private var A: Bool = false
    @State private var Bb: Bool = false
    @State private var B: Bool = false
    
    @State private var western: Bool = false
    
    private var playAvailable: Bool {
        return getSelectedNotesArray().count > 0
    }
    
    var body: some View {
        
        let whiteKeyWidth = screenWidth / 9
        let whiteKeyHeight = screenHeight / 4.5
        // 1.64 is to scale (real life)
        let blackKeyWidth = whiteKeyWidth / 1.3
        let blackKeyHeight = whiteKeyHeight / 1.8
        let blackKeyOffset = (whiteKeyHeight - blackKeyHeight) / 2
        
        let firstBlackKeySpacing = (whiteKeyWidth * 1.35)
        
        let buttonWidth = screenWidth / 4
        let buttonHeight = screenHeight / 13
        
        NavigationView {
            ZStack {
                bgColor
                    .ignoresSafeArea()
                
                VStack {
                    ZStack {
                        HStack(spacing: 5) {
                            Spacer().frame(width: whiteKeyWidth / 2)
                            PianoWhiteKey(width: whiteKeyWidth, height: whiteKeyHeight, selected: $C, western: $western, note: "S", altNote: "")
                            PianoWhiteKey(width: whiteKeyWidth,  height: whiteKeyHeight, selected: $D, western: $western, note: "R2", altNote: "G1")
                            PianoWhiteKey(width: whiteKeyWidth,  height: whiteKeyHeight, selected: $E, western: $western, note: "G3", altNote: "")
                            PianoWhiteKey(width: whiteKeyWidth,  height: whiteKeyHeight, selected: $F, western: $western, note: "M1", altNote: "")
                            PianoWhiteKey(width: whiteKeyWidth,  height: whiteKeyHeight, selected: $G, western: $western, note: "P", altNote: "")
                            PianoWhiteKey(width: whiteKeyWidth,  height: whiteKeyHeight, selected: $A, western: $western, note: "D2", altNote: "N1")
                            PianoWhiteKey(width: whiteKeyWidth,  height: whiteKeyHeight, selected: $B, western: $western, note: "N3", altNote: "")
                            Spacer().frame(width: whiteKeyWidth / 2)
                        }
                        HStack(spacing: 0) {
                            PianoBlackKey(width: blackKeyWidth, height: blackKeyHeight, offset: blackKeyOffset, selected: $Db, western: $western, note: "R1", altNote: "")
                                .offset(x: firstBlackKeySpacing)
                            PianoBlackKey(width: blackKeyWidth, height: blackKeyHeight, offset: blackKeyOffset, selected: $Eb, western: $western, note: "G2", altNote: "R3")
                                .offset(x: firstBlackKeySpacing * 1.25)
                            PianoBlackKey(width: blackKeyWidth, height: blackKeyHeight, offset: blackKeyOffset, selected: $Gb, western: $western, note: "M2", altNote: "")
                                .offset(x: firstBlackKeySpacing * 2.325)
                            PianoBlackKey(width: blackKeyWidth, height: blackKeyHeight, offset: blackKeyOffset, selected: $Ab, western: $western, note: "D1", altNote: "")
                                .offset(x: firstBlackKeySpacing * 2.575)
                            PianoBlackKey(width: blackKeyWidth, height: blackKeyHeight, offset: blackKeyOffset, selected: $Bb, western: $western, note: "N2", altNote: "D3")
                                .offset(x: firstBlackKeySpacing * 2.815)
                            Spacer()
                        }
                    }
                    HStack {
                        Spacer()
                        Button(action: {
                            everythingFalse()
                        }, label: {
                            TogglableButtonView(width: buttonWidth, height: buttonHeight, text: "Clear",
                                                enabled: playAvailable)
                        })
                        .disabled(getSelectedNotesArray().count < 1)
                        Spacer()
                        Button(action: {
                            playSound(instrument: "piano", notes: getSelectedNotesArray())
                        }, label: {
                            TogglableButtonView(width: buttonWidth, height: buttonHeight, text: "Play", enabled: playAvailable)
                        })
                        .disabled(getSelectedNotesArray().count < 1)
                        Spacer()
                        Button(action: {
                            western.toggle()
                        }, label: {
                            ButtonView(width: buttonWidth, height: buttonHeight, text: western ? "Carnatic" : "Western")
                        })
                        Spacer()
                    }
                    .offset(y: 5)
                    ValidRagamsView(
                        validSwaras: getSelectedNotesArray(),
                        screenWidth: screenWidth,
                        screenHeight: screenHeight)
                    Spacer()
                }
                .offset(y: 20)
                .navigationTitle("Find My Raga")
            }
            
        }
        .navigationViewStyle(.stack)
        .preferredColorScheme(.dark)
        .onDisappear {
            stopSound()
        }
    }
    
    func everythingFalse() {
        withAnimation(.default) {
            C = false
            Db = false
            D = false
            Eb = false
            E = false
            F = false
            Gb = false
            G = false
            Ab = false
            A = false
            Bb = false
            B = false
        }
    
        stopSound()
    }
    
    func getSelectedNotesArray() -> [String] {
        var notes: [String] = []
        if (C) {
            notes.append(noteConversions["S"]!)
        }
        if (Db) {
            notes.append(noteConversions["R1"]!)
        }
        if (D) {
            notes.append(noteConversions["R2"]!)
        }
        if (Eb) {
            notes.append(noteConversions["G2"]!)
        }
        if (E) {
            notes.append(noteConversions["G3"]!)
        }
        if (F) {
            notes.append(noteConversions["M1"]!)
        }
        if (Gb) {
            notes.append(noteConversions["M2"]!)
        }
        if (G) {
            notes.append(noteConversions["P"]!)
        }
        if (Ab) {
            notes.append(noteConversions["D1"]!)
        }
        if (A) {
            notes.append(noteConversions["D2"]!)
        }
        if (Bb) {
            notes.append(noteConversions["N2"]!)
        }
        if (B) {
            notes.append(noteConversions["N3"]!)
        }
        
        return notes
    }
}

struct PianoWhiteKey: View {
    
    let width: CGFloat
    let height: CGFloat
    @Binding var selected: Bool
    @Binding var western: Bool
    let note: String
    let altNote: String
    
    var body: some View {
        let westernNote = noteConversions[note]!
        
        ZStack {
            Rectangle()
                .frame(width: width, height: height)
                .foregroundColor(.white)
                .cornerRadius(5)
            VStack(spacing: 1) {
                Text(western ? "" : altNote)
                    .foregroundColor(.gray)
                Text(western ? westernNote : note)
                    .foregroundColor(selected ? .red : .black)
                    .bold(selected)
                    .font(.title3)
            }
            .offset(y: height / 3.14)
        }
        .onTapGesture {
            withAnimation(.default) {
                selected.toggle()
            }
            playSound(instrument: "piano", note: noteConversions[note] ?? "")
            
        }
    }
    
    func playSound(instrument: String, note: String) {
        guard let url = Bundle.main.url(forResource: "\(instrument)-\(note)", withExtension: "wav") else {
            print("Could not find file.")
            return
        }
        
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: url)
            audioPlayer.prepareToPlay()
            audioPlayer.play()
        }
        catch {
            print("Error - \(error.localizedDescription)")
        }
    }
}

struct PianoBlackKey: View {
    
    let width: CGFloat
    let height: CGFloat
    let offset: CGFloat
    @Binding var selected: Bool
    @Binding var western: Bool
    let note: String
    let altNote: String
    
    var body: some View {
        let westernNote = noteConversions[note]!
        
        ZStack {
            Rectangle()
                .frame(width: width, height: height)
                .foregroundColor(.black)
                .cornerRadius(5)
                .shadow(color: .black, radius: selected ? 5 : 0)
            VStack(spacing: 1) {
                Text(western ? "" : altNote)
                    .foregroundColor(.gray)
                Text(western ? westernNote : note)
                    .foregroundColor(selected ? .red : .white)
                    .bold(selected)
                    .font(.title3)
            }
            .offset(y: height / 6)
        }
        .offset(y: -offset)
        .onTapGesture {
            withAnimation(.default) {
                selected.toggle()
            }
            playSound(instrument: "piano", note: noteConversions[note] ?? "")
            
        }
    }
    
    func playSound(instrument: String, note: String) {
        guard let url = Bundle.main.url(forResource: "\(instrument)-\(note)", withExtension: "wav") else {
            print("Could not find file.")
            return
        }
        
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: url)
            audioPlayer.prepareToPlay()
            audioPlayer.play()
        }
        catch {
            print("Error - \(error.localizedDescription)")
        }
    }
}

struct TogglableButtonView: View {
    
    var width: CGFloat
    var height: CGFloat
    var text: String
    var enabled: Bool
    
    let disabledBGColor = Color(red: 211 / 350.0, green: 211 / 350.0, blue: 211 / 350.0)
    
    var body: some View {
        Text(text)
            .bold()
            .frame(width: width, height: height)
            .background(enabled ? .white : disabledBGColor)
            .foregroundColor(.blue)
            .cornerRadius(10)
            .shadow(color: enabled ? .white : .black, radius: 3)
        
        
    }
}

struct ButtonView: View {
    
    var width: CGFloat
    var height: CGFloat
    var text: String
    
    var body: some View {
        Text(text)
            .bold()
            .frame(width: width, height: height)
            .background(.white)
            .foregroundColor(.blue)
            .cornerRadius(10)
            .shadow(color: .white, radius: 5)
    }
}

struct ValidRagamsView: View {
    
    var validSwaras: [String]
    var screenWidth: CGFloat
    var screenHeight: CGFloat
    
    private var filteredRagas: [Raga] {
        return ragas.filter { checkValidRagam(validSwaras: validSwaras, arohanam: $0.arohanam, avarohanam: $0.avarohanam) }
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Spacer()
                VStack {
                    Text("Ragas")
                        .font(.largeTitle)
                        .bold()
                        .foregroundColor(.white)
                    if (filteredRagas.isEmpty) {
                        Text("No ragas match the selected notes.")
                            .bold()
                            .font(.title3)
                            .foregroundColor(.white)
                    }
                    else {
                        VStack {
                            Text("\(filteredRagas.count) matching ragas.")
                                .bold()
                                .font(.title3)
                                .foregroundColor(.white)
                            
                            List(filteredRagas) { raga in
                                NavigationLink(destination: SingleRagaView(raga: raga, screenWidth: screenWidth, screenHeight: screenHeight)) {
                                    HStack {
                                        Text(raga.raga_name)
                                            .font(.title3)
                                        Spacer()
                                        if (Bool(raga.melakarta)!) {
                                            Image(systemName: "staroflife.fill")
                                        }
                                    }
                                    .padding(.horizontal)
                                }
                            }
                            .background(bgColor)
                            .scrollContentBackground(.hidden)
                            
                            
                        }
                        
                    }
                }
                Spacer()
            }
            .offset(y: 10)
            
        }
    }
    
    func checkValidRagam(validSwaras: [String], arohanam: String, avarohanam: String) -> Bool {
        let modArohanam = middleOctave(notes: arohanam)
        let modAvarohanam = middleOctave(notes: avarohanam)
        let convertedAro = convertCarnatictoWestern(carnaticNotes: modArohanam)
        let convertedAvaro = convertCarnatictoWestern(carnaticNotes: modAvarohanam)
        
        let notesArr = convertedAro.components(separatedBy: " ") + convertedAvaro.components(separatedBy: " ")
        
        return Set(validSwaras) == Set(notesArr)
    }
}

struct RagaBuilder_Previews: PreviewProvider {
    static var previews: some View {
        RagaBuilder(screenWidth: 428, screenHeight: 926)
    }
}

func playSound(instrument: String, notes: [String]) {
    var soundItems: [AVPlayerItem] = []
    for note in notes {
        guard let url = Bundle.main.url(forResource: "piano-\(note)", withExtension: "wav") else { return }
        let item = AVPlayerItem(url: url)
        
        soundItems.append(item)
    }
    
    playerQueue = AVQueuePlayer(items: soundItems)
    
    playerQueue.play()
}

func stopSound() {
    playerQueue?.pause()
    playerQueue?.removeAllItems()
    audioPlayer?.stop()
}

func convertCarnatictoWestern(carnaticNotes: String) -> String {
    
    let carnaticArray = carnaticNotes.components(separatedBy: " ")
    let westernArray = carnaticArray.map { noteConversions[$0] ?? ""}
    return westernArray.joined(separator: " ")
}

func middleOctave(notes: String) -> String {
    let notesArray = notes.components(separatedBy: " ")
    let middleArray = notesArray.map { middleConversions[$0] ?? $0}
    return middleArray.joined(separator: " ")
}

let middleConversions = [
    ".M1": "M1",
    ".M2": "M2",
    ".P": "P",
    ".D1": "D1",
    ".D2": "D2",
    ".N1": "N1",
    ".D3": "D3",
    ".N2": "N2",
    ".N3": "N3",
    "S.": "S",
    "R1.": "R1",
    "R2.": "R2",
    "G1.": "G1",
    "R3.": "R3",
    "G2.": "G2",
    "G3.": "G3"
]
