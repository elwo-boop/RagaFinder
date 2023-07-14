//
//  SingleRagaView.swift
//  RagaFinder
//
//  Created by Rakshay Narayanan on 6/27/23.
//

import SwiftUI

struct SingleRagaView: View {
    
    var raga: Raga
    var screenWidth: CGFloat
    var screenHeight: CGFloat
    
    @State private var western = false
    
    var body: some View {
        let isMelakarta = Bool(raga.melakarta)!
        
        // janyaRagas will only be displayed if isMelakarta is true.
        let janyaRagas = ragas.filter {$0.mela_number == raga.mela_number && Bool($0.melakarta) == false}
        
        let parentMelakarta = ragas.filter {$0.mela_number == raga.mela_number && Bool($0.melakarta) == true}[0]
        
        let buttonWidth = screenWidth / 5
        let buttonHeight = screenHeight / 13
        
        let westernArohanam = convertCarnatictoWestern(carnaticNotes: raga.arohanam)
        let westernAvarohanam = convertCarnatictoWestern(carnaticNotes: raga.avarohanam)
    
        ZStack {
            bgColor
                .ignoresSafeArea()
            
            VStack {
                HStack {
                    VStack(alignment: .leading, spacing: 30) {
                        VStack(alignment: .leading) {
                            Text(western ? "Ascending:" : "Arohanam (Aro):")
                                .font(.title3)
                                .bold()
                            Text(western ? westernArohanam : raga.arohanam)
                                .font(.title)
                        }
                        VStack(alignment: .leading) {
                            Text(western ? "Descending:" : "Avarohanam (Avaro):")
                                .font(.title3)
                                .bold()
                            Text(western ? westernAvarohanam : raga.avarohanam)
                                .font(.title)
                        }
                        if isMelakarta == true {
                            Text(western ? "Parent Raga #\(raga.mela_number)" : "Melakarta Raga #\(raga.mela_number)")
                                .font(.title)
                        }
                        else {
                            VStack(alignment: .leading) {
                                Text(western ? "Child Raga of:" : "Janya Raga of:")
                                    .font(.title2)
                                    .bold()
                                Text("\(parentMelakarta.raga_name) - (#\(parentMelakarta.mela_number))")
                                    .font(.title2)
                            }
                        }
                    }
                    Spacer()
                }
                .padding(20)
                
                HStack {
                    Spacer()
                    Button(action: {playSound(instrument: "piano", notes: convertCarnatictoWestern(carnaticNotes: raga.arohanam).components(separatedBy: " "))}, label: {ButtonView(width: buttonWidth, height: buttonHeight, text: western ? "Asc." : "Aro.")})
                    Spacer()
                    Button(action: {playSound(instrument: "piano", notes: convertCarnatictoWestern(carnaticNotes: raga.avarohanam).components(separatedBy: " "))}, label: {ButtonView(width: buttonWidth, height: buttonHeight, text: western ? "Desc." : "Avaro.")})
                    Spacer()
                    Button(action: {playSound(instrument: "piano", notes: convertCarnatictoWestern(carnaticNotes: raga.arohanam + " " + raga.avarohanam).components(separatedBy: " "))}, label: {ButtonView(width: buttonWidth, height: buttonHeight, text: western ? "Asc. + Desc." : "Aro. + Avaro.")})
                    Spacer()
                    Button(action: {western.toggle()}, label: {ButtonView(width: buttonWidth, height: buttonHeight, text: western ? "Carnatic" : "Western")})
                    Spacer()
                    
                }
                Spacer().frame(height: screenHeight / 40)
                if (isMelakarta) {
                    VStack {
                        Text(western ? "Child Ragas of \(raga.raga_name)" : "Janya Ragas of \(raga.raga_name)")
                            .font(.title2)
                            .bold()
                            .foregroundColor(.white)
                        Text(western ? "\(janyaRagas.count) child ragas." : "\(janyaRagas.count) janya ragas.")
                            .font(.title2)
                            .foregroundColor(.white)
                        List(janyaRagas) { raga in
                            NavigationLink(destination: SingleRagaView(raga: raga, screenWidth: screenWidth, screenHeight: screenHeight)) {
                                Text(raga.raga_name)
                                    .font(.title3)
                            }
                        }
                        .scrollContentBackground(.hidden)
                    }
                }
                Spacer()
            }
            .navigationTitle(raga.raga_name)
            .foregroundColor(.white)
        }
        .onDisappear {
            stopSound()
        }
    }
}

struct SingleRagaView_Previews: PreviewProvider {
    static var previews: some View {
        SingleRagaView(raga: ragas[0], screenWidth: 428, screenHeight: 926)
    }
}
