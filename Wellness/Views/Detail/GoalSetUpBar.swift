//
//  GoalSetUpBar.swift
//  Wellness
//
//  Created by Aaron Schultheis on 3/23/24.
//

import SwiftUI

struct GoalSetUpBar: View {
    
    var selectionCount: Int
    let majorButtonDisplay: String
    let minorButtonDisplay: String
    var showMinorButton: Bool
    var showSelectionCount: Bool
    let majorAction: () -> Void
    let minorAction: () -> Void
    
    var body: some View {

        HStack{
            
            if showMinorButton == true{
                
                Spacer()
                
                Button {
                    
                    minorAction()
                    
                } label: {
                    Text("BACK")
                        .font(.system(size: 14))
                        .foregroundColor(.gray)
                        .bold()
                }

                
                Spacer()
                
            }
            
            Button {
                
                majorAction()
                
            } label: {
                ZStack{
                    
                    Rectangle()
                    
                    Color("LightPurple")
                    
                    HStack {
                        Text(majorButtonDisplay)
                            .font(.system(size: 14))
                            .bold()
                            .foregroundColor(.black)
                            
                        
                        if showSelectionCount == true{
                            
                            Text("(\(selectionCount))")
                                .bold()
                                .font(.system(size: 14))
                                .foregroundColor(.black)
                            
                        }
                        
                        Image(systemName: "arrow.right")
                            .foregroundColor(.black)
                    }
                    
                }
            }
            .frame(width: 216, height: 42)
            .cornerRadius(10)
            .overlay(
              RoundedRectangle(cornerRadius: 10)
                .stroke(Color("BorderPurple"), lineWidth: 1)
            )
            
        }//End of HStack
        .padding()
    }
}

#Preview {
    GoalSetUpBar(selectionCount: 4, majorButtonDisplay: "SELECT GOALS", minorButtonDisplay: "BACK", showMinorButton: true, showSelectionCount: true) {
        
    } minorAction: {
        
    }

}

