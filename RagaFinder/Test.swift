//
//  Test.swift
//  RagaFinder
//
//  Created by Rakshay Narayanan on 7/10/23.
//

import SwiftUI

struct Test: View {
    
    var body: some View {
        Text("A. B.. C.. D..".replacingOccurrences(of: "..", with: "."))
    }
    
}

struct Test_Previews: PreviewProvider {
    static var previews: some View {
        Test()
    }
}
