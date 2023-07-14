//
//  RagaData.swift
//  RagaFinder
//
//  Created by Rakshay Narayanan on 6/27/23.
//  Convert ragaInfo.json into a Swift array.

import Foundation

var rawRagas: [Raga] = loadRagas("ragaInfo.json")
var ragas = rawRagas.sorted(by: {$0.raga_name < $1.raga_name})



func loadRagas<T: Decodable>(_ filename: String) -> T {
    let data: Data


    guard let file = Bundle.main.url(forResource: filename, withExtension: nil) else {
        fatalError("Couldn't find \(filename) in main bundle.")
    }


    do {
        data = try Data(contentsOf: file)
    }
    catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }


    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    }
    catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
    
}

struct Raga: Codable, Hashable, Identifiable {
    
    var mela_number: String
    var melakarta: String
    var raga_name: String
    var arohanam: String
    var avarohanam: String

    var id: UUID {
        return UUID()
    }
}
