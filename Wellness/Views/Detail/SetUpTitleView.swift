//
//  SetUpTitleView.swift
//  Wellness
//
//  Created by Aaron Schultheis on 2/24/24.
//

import SwiftUI

struct SetUpTitleView: View {
    var body: some View {
        ZStack(alignment: .topLeading){
            
            Color("TitleBarGray")
                .ignoresSafeArea()
                .shadow(radius: 4)
            
            VStack(alignment: .leading, spacing: 0) {
                Text("Hi, Cool Person! Welcome to App Name.")
                    .multilineTextAlignment(/*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/)
                    .font(.system(size: 34))
                    .bold()
                    .padding()
                
                Text("Let's start by selecting a few activities you're interest in. It's best to start off with 3 to 5.")
                    .font(.system(size: 17))
                    .bold()
                    .padding(.leading)
                
            }
            // End of Vstack
            
        }//End of Zstack
    }
}

#Preview {
    SetUpTitleView()
}
