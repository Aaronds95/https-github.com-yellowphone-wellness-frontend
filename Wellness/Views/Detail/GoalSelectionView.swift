//
//  GoalSelectionView.swift
//  Wellness
//
//  Created by Aaron Schultheis on 3/23/24.
//

import SwiftUI

var userSelections: [String] = []

struct GoalSelectionView: View {
    
    @ObservedObject var goalsVM: IntroGoalsViewModel
    
//    var goals: [introGoal]
//    
//    var userGoals: [userSelectedGoal]
    
    @Binding var userSelectionsCount: Int
    
    var body: some View {
        ScrollView{
            
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 160), spacing: -25)], spacing: 10){
                
                ForEach(goalsVM.goals){goal in
                    
                    SquareSelectionButton(imageName: goal.icon , buttonName: goal.name)
                        .simultaneousGesture(
                            TapGesture()
                                .onEnded{ _ in
                                    
                                    toggleGoalSelection(goal)
                                    
                                    print(goalsVM.selectedGoals)
                                    print(goalsVM.selectedGoals.count)
                                    print(goalsVM.countThingsPlz)
                                    print(userSelectionsCount)
                                    //userSelectionsCount = goalsVM.selectedGoals.count
                                    
                                })//End of tap gesture
                    
                    
                    
                }//End of for each loop
            }//End of LazyVGrid
        }//End of VStack
    }//End of MultiButtonView
    
    func toggleGoalSelection(_ goal: introGoal) {
        if let index = goalsVM.selectedGoals.firstIndex(where: { $0.name == goal.name }) {
            goalsVM.selectedGoals.remove(at: index) // Goal exists, remove it
            
            //userSelectionsCount = goalsVM.selectedGoals.count
        } else {
            // Goal doesn't exist, add it
            let selectedGoal = userSelectedGoal(name: goal.name, icon: goal.icon, description: goal.description, tip: goal.tip, userBaseline: goal.userBaseline, userGoal: goal.userGoal, reminderOn: goal.reminderOn)
            goalsVM.selectedGoals.append(selectedGoal)
            //userSelectionsCount = goalsVM.selectedGoals.count
        }
        
        goalsVM.countThingsPlz = goalsVM.selectedGoals.count
        
        goalsVM.objectWillChange.send()
        //userSelectionsCount = goalsVM.selectedGoals.count
                
    }

}//End of struct

#Preview {
    GoalSelectionView(goalsVM: IntroGoalsViewModel(), userSelectionsCount: .constant(0))
        .environmentObject(IntroGoalsViewModel())
}
