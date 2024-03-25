//
//  GoalSelectionIntro.swift
//  Wellness
//
//  Created by Aaron Schultheis on 3/23/24.
//

import SwiftUI

struct GoalSelectionIntro: View {
    
    @StateObject var goalsVM = IntroGoalsViewModel()
    
    //@Binding var userSelectionsCount: Int
    @State var userSelectionsMade: Bool = false
    
    var body: some View {
        
        if userSelectionsMade == false{
            VStack{
                
                //Upper title area
                SetUpTitleView()
                    .frame(height: 170)
                
                Spacer()
                
                //Text("\(goalsVM.countThingsPlz)")
                
                //Text("\(goalsVM.selectedGoals.count)")
                
                //Displays All the button options
                GoalSelectionView(goalsVM: IntroGoalsViewModel(), userSelectionsCount: $goalsVM.countThingsPlz)
                
                //Shows the dynamic lower tool bar
                GoalSetUpBar(selectionCount: goalsVM.countThingsPlz, majorButtonDisplay:"SETUP GOALS", minorButtonDisplay: "", showMinorButton: false, showSelectionCount: true) {
                    userSelectionsMade.toggle()
                } minorAction: {
                    
                }
                .padding(EdgeInsets(top: 10, leading: 0, bottom: 0, trailing: 0))

                
            }
            
        } else{
            
            UserDetailsView(userSelectionsCount: $goalsVM.countThingsPlz, userSelectionsMade: $userSelectionsMade)
            
        }
        
        
    }
}

#Preview {
    GoalSelectionIntro(goalsVM: IntroGoalsViewModel(), userSelectionsMade: (false))
        .environmentObject(IntroGoalsViewModel())
}
