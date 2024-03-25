//
//  ContentView.swift
//  Wellness
//
//  Created by Aaron Schultheis on 2/24/24.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        GoalSelectionIntro()
    }
}

#Preview {
    ContentView()
        .environmentObject(IntroGoalsViewModel())
}
