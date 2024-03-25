//
//  IntroGoalsModel.swift
//  Wellness
//
//  Created by Aaron Schultheis on 3/24/24.
//

import Foundation

struct introGoal: Identifiable {
    let id = UUID()
    let name: String
    let icon: String
    let description: String
    let tip: String
    let userBaseline: Int
    let userGoal: Int
    let reminderOn: Bool
}

struct userSelectedGoal: Identifiable{
    let id = UUID()
    let name: String
    let icon: String
    let description: String
    let tip: String
    let userBaseline: Int
    let userGoal: Int
    let reminderOn: Bool
}



extension introGoal{
    static let all: [introGoal] = [
        introGoal(name: "DRINK WATER",
                  icon: "drop.circle.fill",
                  description: "Stay hydrated by consuming an adequate amount of water daily to support overall health.",
                  tip: "Aim for at least 8 glasses or about 2 liters of water per day.",
                  userBaseline: 0,
                  userGoal: 0,
                  reminderOn: false
         ),
        introGoal(name: "READ A BOOK",
                  icon: "books.vertical.circle.fill",
                  description: "Immerse yourself in a good book to relax, learn, and engage your mind.",
                  tip: "Dedicate 20-30 minutes a day to reading for mental stimulation.",
                  userBaseline: 0,
                  userGoal: 0,
                  reminderOn: false
        ),
        introGoal(name: "CALL FRIENDS & FAMILY",
                  icon: "phone.circle.fill",
                  description: "Connect with loved ones to strengthen relationships and foster social well-being.",
                  tip: "Aim to have regular calls or social interactions throughout the week.",
                  userBaseline: 0,
                  userGoal: 0,
                  reminderOn: false
         ),
        introGoal(name: "WORKOUT",
                  icon: "figure.run.circle.fill",
                  description: "Engage in structured physical activity to improve fitness and overall health.",
                  tip: "Strive for at least 150 minutes of moderate-intensity exercise per week.",
                  userBaseline: 0,
                  userGoal: 0,
                  reminderOn: false
         ),
        introGoal(name: "STRETCH",
                  icon: "figure.wave.circle.fill",
                  description: "Incorporate stretching exercises to enhance flexibility and reduce muscle tension.",
                  tip: "Spend 5-10 minutes stretching after each workout or during breaks.",
                  userBaseline: 0,
                  userGoal: 0,
                  reminderOn: false
         ),
        introGoal(name: "TRY SOMETHING NEW",
                  icon: "lightbulb.circle.fill",
                  description: "Embrace novelty to stimulate your mind and break out of routine for personal growth.",
                  tip: "Set aside time each week to try a new activity or experience.",
                  userBaseline: 0,
                  userGoal: 0,
                  reminderOn: false
         ),
        introGoal(name: "GO FOR A WALK",
                  icon: "figure.walk.circle.fill",
                  description: "Take a leisurely stroll to enjoy nature, boost mood, and improve physical well-being.",
                  tip: "Aim for a 30-minute walk most days of the week.",
                  userBaseline: 0,
                  userGoal: 0,
                  reminderOn: false
         ),
        introGoal(name:  "GET ENOUGH SLEEP",
                  icon: "bed.double.circle.fill",
                  description: "Prioritize sufficient and quality sleep to support cognitive function and recovery.",
                  tip: "Aim for 7-9 hours of sleep per night for optimal well-being.",
                  userBaseline: 0,
                  userGoal: 0,
                  reminderOn: false
         ),
        introGoal(name: "TAKE A BREAK",
                  icon: "moon.circle.fill",
                  description: "Pause and relax to recharge your mental energy and reduce stress.",
                  tip: "Incorporate short mental breaks throughout the day, such as 5 minutes.",
                  userBaseline: 0,
                  userGoal: 0,
                  reminderOn: false
         ),
        introGoal(name: "MEDITATE",
                  icon: "pause.circle.fill",
                  description: "Practice mindfulness meditation for relaxation, focus, and stress reduction.",
                  tip: "Start with 5-10 minutes of meditation daily and gradually increase.",
                  userBaseline: 0,
                  userGoal: 0,
                  reminderOn: false
         )
    ]
}


extension userSelectedGoal{
    static let all: [userSelectedGoal] = []
}
