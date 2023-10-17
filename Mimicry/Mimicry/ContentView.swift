//
//  ContentView.swift
//  Mimicry
//
//  Created by nastasya on 17.10.2023.
//

import SwiftUI

struct ContentView: View {
    @Namespace private var animation
    @State private var isZoomed = true
    
    var body: some View {
            VStack {
                if isZoomed {
                Spacer()
                HStack{
                    Spacer()
                    Button(action: {
                        withAnimation(.easeInOut) {
                            isZoomed.toggle()
                        }
                    }, label: {
                            Text("Open")
                                .matchedGeometryEffect(id: "Text", in: animation)
                                .foregroundStyle(.white)
                        })
                    .matchedGeometryEffect(id: "Button", in: animation)
                    .padding()
                    .buttonStyle(.borderedProminent)
                    .tint(.purple)
                    .font(.title2)
                }
            } else {
                ZStack(alignment: .topLeading) {
                    RoundedRectangle(cornerRadius: 20, style:
                            .circular)
                        .fill(.purple)
                        .matchedGeometryEffect(id: "Button", in: animation)
                        .frame(width: 300, height: 400)
                    Button(action: {
                        withAnimation(.easeInOut) {
                            isZoomed.toggle()
                        }
                    }, label: {
                        HStack {
                            Image(systemName: "arrowshape.backward.fill")
                            Text("Back")
                        }
                        .matchedGeometryEffect(id: "Text", in: animation, properties: .position)
                        .padding()
                        .font(.title2)
                        .foregroundStyle(.white)
                    })
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
