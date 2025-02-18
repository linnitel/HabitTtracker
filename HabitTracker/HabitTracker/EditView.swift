//
//  EditView.swift
//  HabitTracker
//
//  Created by Julia Martcenko on 17/02/2025.
//

import SwiftUI

struct EditView: View {
	@Environment(\.dismiss) var dismiss

	var habitsViewModel: HabitViewModel
	@Binding var habit: HabitModel

    var body: some View {
		List {
			HStack {
				Text("Times done: \(habit.timesDone)")
				Spacer()
				Button("+") {
					habit.timesDone += 1
				}
			}
			TextField("Title", text: $habit.name)
				.font(.largeTitle)
			TextField("Description", text: $habit.description)
				.frame(minHeight: 80, alignment: .top)
		}
		.toolbar {
			ToolbarItem(placement: .topBarTrailing) {
				Button("Save") {
//					let habit = HabitModel(name: name, description: description, timesDone: timesDone)
//					habitsViewModel.increaseTimesDone(for: habit)

					dismiss()
				}
			}
		}
		.navigationBarBackButtonHidden(true)
	}
}

#Preview {
	EditView(habitsViewModel: HabitViewModel(), habit: .constant(HabitModel(name: "Tiansdf", description: "Desdlkjsfl")))
}
