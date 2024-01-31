//
//  ContentView.swift
//  SwiftUIConcepts
//
//  Created by Rajneesh kumar on 11/10/23.
//

import SwiftUI

struct ContentView: View {
    @State var phone: String = ""
    @FocusState var isInputActive: Bool
    @State var isPresented = false
    @State var angle:Double = 0
    var body: some View {
        
        ZStack {
            RoundedRectangle(cornerRadius: 10, style: .continuous)
                .fill(.white)
                .frame(width: 260, height: 340)
                .shadow(radius: 10)
//                .overlay(alignment: .center) {
//                    RoundedRectangle(cornerRadius: 10)
//                        .fill(.white)
//                        .
//                }
            
            RoundedRectangle(cornerRadius: 10, style: .continuous)
                .frame(width: 200, height: 500)
                .foregroundStyle(LinearGradient(colors: [Color.green, Color.cyan, Color.blue], startPoint: .leading, endPoint: .trailing))
                .rotationEffect(.degrees(angle))
                .mask {
                    RoundedRectangle(cornerRadius: 10, style: .continuous)
                        .stroke(lineWidth: 5)
                        .frame(width: 256, height: 336)
                }
            
            VStack {
                Text("Masking Pattern")
            }
        }
       
        
        //
        //        ScrollView {
        //            ScrollView(.horizontal) {
        //                HStack {
        //                    ForEach(0..<100) { val in
        //                        Text("\(val): test test")
        //                    }
        //                }
        //            }
        //        }
        //                ScrollView {
        //                    VStack {
        //                        ScrollView(.horizontal) {
        //                            ForEach(0..<100) { val in
        //                                HStack {
        //                                    Text("\(val): test test")
        //                                }
        //                            }
        //                        }
        //                    }
        //                }
        
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            TextField("Fill", text: $phone)
                .textFieldStyle(.roundedBorder)
                .focused($isInputActive)
                .keyboardType(.phonePad)
                .padding(10)
                .autocorrectionDisabled(false)
                .textContentType(.telephoneNumber)
                .multilineTextAlignment(.center)
                .toolbar {
                    ToolbarItemGroup(placement: .keyboard) {
                        Spacer()
                        
                        Button("Done") {
                            isInputActive = false
                        }
                    }
                }
                .overlay(
                    RoundedRectangle(cornerRadius: 12)
                        .inset(by: 1)
                        .stroke(Color("Purple4").opacity(0.75), lineWidth: 2)
                )
            Spacer()
            Text("Hello, world!")
            
            Button("Show Sheet") {
                isPresented = true
            }
        }
        .sheet(isPresented: $isPresented, content: {
            VStack(alignment: .center) {
                
                VStack {
                    Text("Hello")
                    Spacer()
                }
                .frame(maxWidth: 300, maxHeight: 200)
                .background(.white)
            }
            .presentationDetents([.medium])
            .presentationBackground(.clear)
//            .frame(maxWidth: .infinity, maxHeight: .infinity)
            //.background(.black.opacity(0.2))
            
        })
        .onAppear(perform: {
            withAnimation(.linear(duration: 4).repeatForever(autoreverses: false)) {
                angle = 360
            }
        })
//        .actionSheet(item: $isPresented, content: { <#T#> in
//            <#code#>
//        })
        .ignoresSafeArea(.keyboard)
    }
}

#Preview {
    ContentView()
}
