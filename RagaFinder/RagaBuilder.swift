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

struct RagaBuilder: View {
    
    var screenWidth: CGFloat
    var screenHeight: CGFloat
    
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
                            ButtonView(width: buttonWidth, height: buttonHeight, text: "Clear")
                        })
                        Spacer()
                        Button(action: {
                            playSound(instrument: "piano", notes: getSelectedNotesArray())
                        }, label: {
                            ButtonView(width: buttonWidth, height: buttonHeight, text: "Play")
                        })
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
    }
    
    func getSelectedNotesArray() -> [String] {
        var notes: [String] = []
        if (C) {
            notes.append("C")
        }
        if (Db) {
            notes.append("Db")
        }
        if (D) {
            notes.append("D")
        }
        if (Eb) {
            notes.append("Eb")
        }
        if (E) {
            notes.append("E")
        }
        if (F) {
            notes.append("F")
        }
        if (Gb) {
            notes.append("Gb")
        }
        if (G) {
            notes.append("G")
        }
        if (Ab) {
            notes.append("Ab")
        }
        if (A) {
            notes.append("A")
        }
        if (Bb) {
            notes.append("Bb")
        }
        if (B) {
            notes.append("B")
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
                        Text("\(filteredRagas.count) matching ragas.")
                            .bold()
                            .font(.title3)
                            .foregroundColor(.white)
                    }
                }
                Spacer()
            }
            .offset(y: 10)
            List(filteredRagas) { raga in
                NavigationLink(destination: SingleRagaView(raga: raga, screenWidth: screenWidth, screenHeight: screenHeight)) {
                    Text(raga.raga_name)
                        .font(.title3)
                }
            }
            .scrollContentBackground(.hidden)
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

let noteConversions = [
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
