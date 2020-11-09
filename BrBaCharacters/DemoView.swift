//
//  DemoView.swift
//  BrBaCharacters
//
//  Created by Milan Chalishajarwala on 10/24/20.
//

import SwiftUI

struct DemoView: View {
    var body: some View {
        Text("Hello, World!")
        Text("Hello, World!")

    }
}

var child = UIHostingController(rootView: DemoView())

struct DemoView_Previews: PreviewProvider {
    static var previews: some View {
        DemoView()
    }
}
