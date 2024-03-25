//
//  SquareSelectionButton.swift
//  Wellness
//
//  Created by Aaron Schultheis on 3/23/24.
//

import SwiftUI

struct SquareSelectionButton: View {
    
    let imageName: String
    let buttonName: String
    
    @State var clickedState: Bool = false
    
    var body: some View {
        ZStack {
            
            VStack(spacing: 0) {
                HStack {
                    Image(systemName: (imageName))
                        .resizable()
                        .scaledToFit()
                        .foregroundColor(.black)
                        .frame(width: 42, height: 42)
                        .padding(EdgeInsets(top: 10, leading: 10, bottom: 0, trailing: 0))
                    
                    Spacer()
                }
                
                Spacer()
                
                HStack{
                    
                    //Spacer()
                    
                    Text(buttonName)
                        .foregroundColor(.black)
                        .font(.system(size: 36, weight: .bold))
                        .multilineTextAlignment(.leading)
                        .lineSpacing(1)
                        .padding(EdgeInsets(top: 0, leading: 0, bottom: 3, trailing: 10))
                    
                    Spacer()
                    
                }
                
            }//End of VStack
        }//End of ZStack
        .frame(width: 160, height: 160)
        .background(
            LinearGradient(gradient: Gradient(colors: [Color("GradiantBlue").opacity(clickedState ? 1 : 0.5),Color("GradiantPurple").opacity(clickedState ? 1 : 0.5)]), startPoint: .topLeading, endPoint: .bottom)
        )
        .cornerRadius(10)
        .overlay(
          RoundedRectangle(cornerRadius: 10)
            .stroke(Color(Color(clickedState ? .purple : .clear)), lineWidth: 2)
        )
        .onTapGesture{
            clickedState.toggle()
        }//End of tap gesture
        
    }
}

#Preview {
    SquareSelectionButton(imageName: "drop.circle.fill", buttonName: "DRINK WATER")
}

