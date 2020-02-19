//
//  ContentView.swift
//  ActionSheetWithRadioButtons
//
//  Created by ramil on 19.02.2020.
//  Copyright © 2020 com.ri. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            RadioButtons()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct RadioButtons: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("FIlter By")
                .padding(.top)
            
            ForEach(data, id: \.self) { i in
                Button(action: {
                    
                }) {
                    HStack {
                        Text(i)
                        Spacer()
                        Circle()
                            .fill(Color.black.opacity(0.5))
                            .frame(width: 20, height: 20)
                    }
                }
            }
        }
        .padding(.vertical)
        .padding(.horizontal, 25)
    }
}

var data = [
    "Relevance",
    "Newest",
    "Price(low to high)",
    "Price(high to low)",
    "Sort by Specs",
    "Sort By Storage"
]
