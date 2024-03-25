//
//  IntroGoalsViewModel.swift
//  Wellness
//
//  Created by Aaron Schultheis on 3/24/24.
//

import Foundation


class IntroGoalsViewModel: ObservableObject{
    
    @Published var goals: [introGoal] = []
    
    @Published var selectedGoals: [userSelectedGoal] = []
    
    @Published var countThingsPlz: Int
    
    init(){
        
        goals = introGoal.all
        
        selectedGoals = userSelectedGoal.all
        
        countThingsPlz = 0
        
    }
    
}
