//
//  HabitViewModel.swift
//  HabitTracker
//
//  Created by Julia Martcenko on 17/02/2025.
//

import SwiftUI

@Observable
class HabitViewModel {
	var habits = [HabitModel]() {
		didSet {
			if let encoded = try? JSONEncoder().encode(habits) {
				UserDefaults.standard.set(encoded, forKey: "habits")
			}
		}
	}

	init() {
		if let savedItems = UserDefaults.standard.data(forKey: "habits") {
			if let decodeItems = try? JSONDecoder().decode([HabitModel].self, from: savedItems) {
				habits = decodeItems
				return
			}
		}

		habits = []
	}

	func increaseTimesDone(for habit: HabitModel) {
		for i in 0..<habits.count {
			if habits[i].id == habit.id {
				habits[i].timesDone += 1
				break
			}
		}
	}
}
