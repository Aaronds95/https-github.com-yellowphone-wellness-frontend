//
//  UserDetailsView.swift
//  Wellness
//
//  Created by Aaron Schultheis on 3/24/24.
//

import SwiftUI

struct Goal: Identifiable {
    let id = UUID()
    let name: String
    let icon: String
    let description: String
    let tip: String
    let userBaseline: Int
    let userGoal: Int
    let reminderOn: Bool
}

struct UserDetailsView: View {
    @State var selectedGoals: [Goal] = [Goal(name: "DRINK WATER", icon: "drop.circle.fill" , description: "Stay hydrated by consuming an adequate amount of water daily to support overall health.", tip: "Aim for at least 8 glasses or about 2 liters of water per day.", userBaseline: 0, userGoal: 0, reminderOn: false ), Goal(name: "READ A BOOK",icon: "books.vertical.circle.fill", description: "Immerse yourself in a good book to relax, learn, and engage your mind.", tip: "Dedicate 20-30 minutes a day to reading for mental stimulation.", userBaseline: 0, userGoal: 0, reminderOn: false)]
    @State var currentPageIndex: Int = 0
    @State var userDetails: [String] = Array(repeating: "", count: 3) // Adjust count based on the number of details to collect for each goal
    
    @Binding var userSelectionsCount: Int
    @Binding var userSelectionsMade: Bool
    
    @State var userBaselineValue: Double = 0.0
    @State var userGoalValue: Double = 0.0
    @State var turnOnReminders: Bool = false

    var body: some View {
        VStack {
            
            ZStack{
                
                Color("TitleBarGray")
                    .ignoresSafeArea()
                    .shadow(radius: 4)
                
                VStack(alignment: .leading){
                    
                    Text("Next, let's build your goals.")
                        .font(.system(size: 24))
                        .bold()
                        .padding(.bottom)
                    
                    Text("For each activity you selected, we'll pick some goals to work towards.")
                        .font(.system(size: 17))
                    
                }
            }
            .frame(height: 130)
            
            Spacer()
            
            ProgressBar(totalSteps: userSelectionsCount, currentStep: currentPageIndex)
                .padding(.top, 20)
            
            if currentPageIndex < selectedGoals.count {
                GoalDetailsView(goal: selectedGoals[currentPageIndex], userDetails: $userDetails[currentPageIndex], turnOnReminders: $turnOnReminders, userBaselineValue: $userBaselineValue, userGoalValue: $userGoalValue)
                    .transition(.slide)
            } else {
                Text("Sign Up Completed!")
                    .font(.title)
                    .padding()
            }

            Spacer()
            
            if currentPageIndex < userSelectionsCount {

                GoalSetUpBar(selectionCount: 0, majorButtonDisplay: "SAVE & NEXT GOAL", minorButtonDisplay: "BACK", showMinorButton: true, showSelectionCount: false) {
                    
                    nextPage()
                    print(currentPageIndex)
                    
                } minorAction: {
                    
                    if currentPageIndex == 0 {
                        
                        userSelectionsMade.toggle()
                        
                        print(userSelectionsMade)
                        print(currentPageIndex)
                        
                    }else{
                        
                        goBack()
                        
                        print(currentPageIndex)
                        
                    }
                }
            } else {
                GoalSetUpBar(selectionCount: 0, majorButtonDisplay: "SAVE & SEE DASHBOARD", minorButtonDisplay: "BACK", showMinorButton: true, showSelectionCount: false) {
                    
                } minorAction: {
                    
                    goBack()
                    
                }
            }
        }//End of Vstack
    }//End of View
    func nextPage() {
        currentPageIndex += 1
    }
    
    func goBack(){
        currentPageIndex -= 1
    }
}

struct GoalDetailsView: View {
    let goal: Goal
    @Binding var userDetails: String
    @Binding var turnOnReminders: Bool
    @Binding var userBaselineValue: Double
    @Binding var userGoalValue: Double

    var body: some View {
        VStack(alignment: .leading) {
            
            DetailCard(goalIcon: goal.icon, goalTitle: goal.name, goalDescription: goal.description, goalTip: goal.tip)
        
            Spacer(minLength: 10)
            
            Text("First, let’s establish a baseline! How much water do you currently drink per day?")
            
            ZStack{
                
                Slider(value: $userBaselineValue, in: 0...5, step: 1)
                    .tint(Color.green)
                
                
                HStack(spacing: 9){
                    ForEach(0...5, id: \.self){point in
                        
                        Spacer()
                        
                        VStack{
                            
                            Circle()
                                .foregroundColor(.white)
                                .frame(height:10)
                                .padding(6)
                            
                            Text("\(point) L")
                                .font(.system(size: 10))
                                .bold()

                        }
                        .padding(EdgeInsets(top: 15, leading: 0, bottom: 0, trailing: 0))
                        
                        Spacer()
                    }
                }
                
                
            }
            
            Text("And then, let’s set a goal daily goal to work towards!")
            
            ZStack{
                Slider(value: $userGoalValue, in: 0...5, step: 1)
                    .tint(Color.green)
                
                
                HStack(spacing: 9){
                    ForEach(0...5, id: \.self){point in
                        
                        Spacer()
                        
                        VStack{
                            
                            Circle()
                                .foregroundColor(.white)
                                .frame(height:10)
                                .padding(6)
                            
                            Text("\(point) L")
                                .font(.system(size: 10))
                                .bold()

                        }
                        .padding(EdgeInsets(top: 15, leading: 0, bottom: 0, trailing: 0))
                        
                        Spacer()
                    }
                }
            }
            
            Spacer()
            
            Toggle("Reminders help you stay on track for your goals. Would you like to be reminded of this goal?", isOn: $turnOnReminders)

            Spacer()
        }
        .padding()
    }
}

struct ProgressBar: View {
    var totalSteps: Int
    let currentStep: Int

    var body: some View {
        HStack {
            ForEach(0..<totalSteps) { step in
                Circle()
                    .fill(step == currentStep ? Color.green : Color.gray)
                    .frame(width: 10, height: 10)
                    .padding(.trailing, 8)
            }
        }
        .padding(.horizontal)
    }
}


#Preview {
    UserDetailsView(userSelectionsCount: .constant(4), userSelectionsMade: .constant(false))
}
