//
//  ContentView.swift
//  ActionSheetWithRadioButtons
//
//  Created by ramil on 19.02.2020.
//  Copyright © 2020 com.ri. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State var selected = ""
    @State var show = false
    
    var body: some View {
        ZStack {
            VStack {
                Button(action: {
                    self.show.toggle()
                }) {
                    Text("Open")
                        .padding(.vertical)
                        .padding(.horizontal, 25)
                        .foregroundColor(.white)
                }.background(LinearGradient(gradient: .init(colors: [Color("Color"), Color("Color1")]), startPoint: .leading, endPoint: .trailing))
                .clipShape(Capsule())
                
                Text(self.selected)
                    .padding(.top)
            }
            VStack {
                Spacer()
                RadioButtons(selected: self.$selected, show: self.$show)
                    .offset(y: self.show ? (UIApplication.shared.windows.last?.safeAreaInsets.bottom)! + 15 : UIScreen.main.bounds.height)
            }.background(Color(UIColor.label.withAlphaComponent(self.show ? 0.2 : 0)).edgesIgnoringSafeArea(.all))
        }.background(Color("Color2").edgesIgnoringSafeArea(.all))
        .animation(.default)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct RadioButtons: View {
    @Binding var selected: String
    @Binding var show: Bool
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("Filter By")
                .font(.title)
                .padding(.top)
            
            ForEach(data, id: \.self) { i in
                Button(action: {
                    self.selected = i
                }) {
                    HStack {
                        Text(i)
                        Spacer()
                        ZStack {
                            Circle()
                                .fill(self.selected == i ? Color("Color") : Color.black.opacity(0.5))
                                .frame(width: 18, height: 18)
                            
                            if self.selected == i {
                                Circle()
                                    .stroke(Color("Color1"), lineWidth: 4)
                                    .frame(width: 25, height: 25)
                            }
                        }
                    }.foregroundColor(.black)
                }.padding()
            }
            
            HStack {
                Spacer()
            
                Button(action: {
                    self.show.toggle()
                }) {
                    Text("Continue")
                        .padding(.vertical)
                        .padding(.horizontal, 25)
                        .foregroundColor(.white)
                }
                .background(
                    self.selected != "" ?
                    LinearGradient(gradient: .init(colors: [Color("Color"), Color("Color1")]), startPoint: .leading, endPoint: .trailing)
                    :
                        LinearGradient(gradient: .init(colors: [Color.black.opacity(0.2), Color.black.opacity(0.2)]), startPoint: .leading, endPoint: .trailing)
                    )
                    
                .clipShape(Capsule())
                .disabled(self.selected != "" ? false : true)
                
            }.padding(.top)
        }
        .padding(.vertical)
        .padding(.horizontal, 25)
        .padding(.bottom, (UIApplication.shared.windows.last?.safeAreaInsets.bottom)! + 15)
        .background(Color.white)
        .cornerRadius(30)
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
