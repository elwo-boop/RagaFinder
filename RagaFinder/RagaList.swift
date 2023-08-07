//
//  RagaList.swift
//  RagaFinder
//
//  Created by Rakshay Narayanan on 6/18/23.
//

import SwiftUI

struct RagaList: View {
    
    let screenWidth: CGFloat
    let screenHeight: CGFloat
    
    @State private var searchTerm = ""
    
    private var filteredRagas: [Raga] {
        guard !searchTerm.isEmpty else { return ragas }
        return ragas.filter { $0.raga_name.localizedCaseInsensitiveContains(searchTerm) }
    }
    
    
    var body: some View {
        NavigationStack {
            ZStack {
                bgColor
                    .ignoresSafeArea()
                
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
                .scrollContentBackground(.hidden)
                .searchable(text: $searchTerm, prompt: "Search Ragas")
                .autocorrectionDisabled(true)
            }
            .navigationTitle("Ragas")
            .preferredColorScheme(.dark)
        }
    }
}

struct RagaList_Previews: PreviewProvider {
    static var previews: some View {
        RagaList(screenWidth: 428, screenHeight: 926)
    }
}
