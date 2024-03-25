//
//  DetailCard.swift
//  Wellness
//
//  Created by Aaron Schultheis on 3/23/24.
//

import SwiftUI

struct DetailCard: View {
    
    let goalIcon: String
    let goalTitle: String
    let goalDescription: String
    let goalTip: String
    
    
    var body: some View {
        ZStack{
            
            Color("BorderPurple").opacity(0.1)
            
            
            HStack{
                
                ZStack {
                    
                    VStack(spacing: 0) {
                        HStack {
                            Image(systemName: (goalIcon))
                                .resizable()
                                .scaledToFit()
                                .foregroundColor(.black)
                                .frame(width: 42, height: 42)
                                .padding(EdgeInsets(top: 10, leading: 10, bottom: 0, trailing: 0))
                            
                            Spacer()
                        }
                        
                        Spacer()
                        
                        HStack{
                            
                            Spacer()
                            
                            Text(goalTitle)
                                .foregroundColor(.black)
                                .font(.system(size: 36, weight: .bold))
                                .multilineTextAlignment(.trailing)
                                .lineSpacing(1)
                                .padding(EdgeInsets(top: 0, leading: 0, bottom: 3, trailing: 10))
                        }
                        
                    }//End of VStack
                }//End of ZStack
                .frame(width: 160, height: 160)
                .background(
                    LinearGradient(gradient: Gradient(colors: [Color("GradiantBlue").opacity(0.5),Color("GradiantPurple").opacity(0.5)]), startPoint: .topLeading, endPoint: .bottom)
                )
                .cornerRadius(10)
                
                Spacer()
                
                VStack(alignment: .leading){
                    Text(goalDescription)
                        .font(.system(size: 14))
                        .padding(EdgeInsets(top: 10, leading: 0, bottom: 0, trailing: 0))
                    
                    
                    Spacer()
                    
                    Text(goalTip)
                        .font(.system(size: 14))
                        .padding(EdgeInsets(top: 0, leading: 0, bottom: 10, trailing: 0))
                    
                }
                
                Spacer()
                
            }
        }
        .frame(width: 352, height: 160)
        .cornerRadius(10)
        .overlay(
          RoundedRectangle(cornerRadius: 10)
            .stroke(Color("BorderPurple"), lineWidth: 1)
        )
    }
}

#Preview {
    DetailCard(goalIcon: "drop.circle.fill", goalTitle: "DRINK WATER", goalDescription: "Stay hydrated by consuming an adequate amount of water daily to support overall health.", goalTip: "Aim for at least 8 glasses or about 2 liters of water per day.")
}
