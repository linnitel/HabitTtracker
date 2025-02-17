//
//  EditView.swift
//  HabitTracker
//
//  Created by Julia Martcenko on 17/02/2025.
//

import SwiftUI

struct EditView: View {
	@Environment(\.dismiss) var dismiss

	var habitItem: HabitModel

	@State var name: String
	@State var description: String
	@State var timesDone: Int

    var body: some View {
		List {
			HStack {
				Text("Times done: \(timesDone)")
				Spacer()
				Button("+") {
					timesDone += 1
				}
			}
			TextField("Title", text: $name)
				.font(.largeTitle)
			TextField("Description", text: $description)
				.frame(minHeight: 80, alignment: .top)
		}
		.toolbar {
			ToolbarItem(placement: .topBarTrailing) {
				Button("Save") {
					let habit = HabitModel(name: name, description: description, timesDone: timesDone)
					habits.increaseTimesDone(for: habit)

					dismiss()
				}
			}
		}
		.navigationBarBackButtonHidden(true)
	}
}

#Preview {
	EditView(habitsViewModel: HabitViewModel(), habitItem: HabitModel(name: "Title", description: "Description"))
}
