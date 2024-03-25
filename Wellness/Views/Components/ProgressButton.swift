//
//  ProgressButton.swift
//  Wellness
//
//  Created by Aaron Schultheis on 3/23/24.
//

import SwiftUI

struct ProgressButton: View {
    
    @State private var goalAttempts: Double  = 5
    @State private var completeAttempts: Double  = 0
        
    var body: some View {
        VStack {
            progressButtonFunc(completeAttempts,goalAttempts)
                .frame(width: 120, height: 120)
            
        }
        .padding()
        .onTapGesture {
            completeAttempts += 1
        }
    }
        
        
    func progressButtonFunc(_ completeAttempts: Double, _ goalAttempts: Double) -> some View {
            GeometryReader { proxy in
                ZStack {
                    Circle()
                        .fill(.gray.opacity(0.3).shadow(.drop(color: .black, radius: 10)))
                    Circle()
                        .inset(by: proxy.size.width / 4)
                        .trim(from: 0, to: completeAttempts /  goalAttempts)
                        .stroke(LinearGradient(gradient: Gradient(colors: [Color("GradiantBlue").opacity(1),Color("GradiantPurple").opacity(1)]), startPoint: .topLeading, endPoint: .bottom), style: StrokeStyle(lineWidth: proxy.size.width / 2))
                        .rotationEffect(.radians(-.pi/2))
                        .animation(.linear, value: completeAttempts)
                    Image(systemName: "drop.circle.fill")
                        .resizable()
                        .scaledToFit()
                        .foregroundColor(.black)
                        .frame(width: 45, height: 45)
                }
            }
    }
}


#Preview {
    ProgressButton()
}
