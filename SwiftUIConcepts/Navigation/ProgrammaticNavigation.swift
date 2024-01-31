//
//  ProgrammaticNavigation.swift
//  SwiftUIConcepts
//
//  Created by Rajneesh kumar on 09/01/24.
//

import SwiftUI
import UIKit

struct ProgrammaticNavigation: View {
    
    @State private var presentedNumbers = [Int]()


    
    var body: some View {
        NavigationStack(path: $presentedNumbers) {
//            let when = Date(timeIntervalSinceReferenceDate: 656904575.211251)
            
            VStack {
                Text(Date(), format: .dateTime.hour().minute())
                    .font(.system(size: 20))
                Text(Date(), format: .dateTime.month().day().hour(.conversationalTwoDigits(amPM: .omitted)).minute().timeZone(.specificName(.short)))
                    .font(.system(size: 20))
            }
            
//            snapshot()
            List(1..<50) { index in
                
                NavigationLink(value: index) {
                    Text("Order: ")
                        .font(.title)
                    + Text("\(index)")
                }
            }
            .navigationDestination(for: Int.self) { value in
                Text("Destination: \(value)")
            }
            .navigationTitle("Programmatic Navigation")
            
        }
        .task {
//           let img = UIImage(named: "SrdHEA8N")?.addMessageAtTop(drawText: "Hello World")
//            print("This is Imag")
//            DispatchQueue.main.asyncAfter(deadline: (.now() + 2.0), execute: {
//                presentedNumbers.append(5)
//            })
        }
    }
    
    @MainActor func snapshot() -> Image {
            let imagerenderer = ImageRenderer(
                content: ZStack{
                    Image("SrdHEA8N")
                        .resizable()
                        .scaledToFit()
                    VStack {
                        Text("Hello, world!")
                            .font(.largeTitle)
                        Spacer()
                    }
                }.frame(width: 300, height: 200)
            )
            return Image(uiImage: imagerenderer.uiImage!)
        }
}

#Preview {
    ProgrammaticNavigation()
}
