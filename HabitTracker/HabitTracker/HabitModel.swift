//
//  HabitModel.swift
//  HabitTracker
//
//  Created by Julia Martcenko on 17/02/2025.
//

import Foundation

struct HabitModel: Identifiable, Codable, Hashable {
	var id = UUID()
	var name: String
	var description: String
	var timesDone: Int = 0
}
