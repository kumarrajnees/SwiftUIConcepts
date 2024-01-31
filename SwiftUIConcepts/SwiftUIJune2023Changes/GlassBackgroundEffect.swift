//
//  GlassBackgroundEffect.swift
//  SwiftUIConcepts
//
//  Created by Rajneesh kumar on 19/01/24.
//

import SwiftUI

struct GlassBackgroundEffect: View {
    
    @State var rotationAngle: Double = 0
    
    var body: some View {
        ZStack {
            
//            LinearGradient(gradient: Gradient(colors: [.red, .yellow, .green]),
//                           startPoint: .leading,
//                           endPoint: .trailing )
//            .rotationEffect(.degrees(120))
            
            Image("SrdHEA8N")
                .resizable()
                .scaledToFit()
            
           
            VStack(spacing: 20) {
                ForEach(0...20, id:\.self) { index in
                    Text("Visit Singapore: \(index)")
                }
            }
            .frame(maxWidth: .infinity)
            .rotation3DEffect(
                .degrees(rotationAngle),

                axis: (x: 0.0, y: 1.0, z: 0.0)
            )
            
            RoundedRectangle(cornerRadius: 10)
                .fill(.white)
                .shadow(radius: 10, x: 10, y: 10)
                .frame(width: 200, height: 100)
                .overlay(RoundedRectangle(cornerRadius: 10)
                    .stroke(.blue, lineWidth: 5))
                .overlay(alignment: .topLeading) { Star(color: .red) }
                .overlay(alignment: .topTrailing) { Star(color: .yellow) }
                .overlay(alignment: .bottomLeading) { Star(color: .green) }
                .overlay(alignment: .bottomTrailing) { Star(color: .blue) }
                
        }
        .background(
            LinearGradient(gradient: Gradient(colors: [.red, .clear, .green]),
                           startPoint: .leading,
                           endPoint: .trailing )
            .rotation3DEffect(
                .degrees(rotationAngle),

                axis: (x: 0.0, y: 1.0, z: 0.0)
            )
        )
        .onAppear(perform: {
            withAnimation(.linear(duration: 10).repeatForever(autoreverses: false)) {
//                rotationAngle = 360
            }
            
            withAnimation(.spring(duration: 10)) {
//                rotationAngle = 360
            }
        })
    }
}

struct Star: View {
    var color = Color.yellow


    var body: some View {
        Image(systemName: "star.fill")
            .foregroundStyle(color)
    }
}

#Preview {
    GlassBackgroundEffect()
}
