//
//  EditView.swift
//  HabitTracker
//
//  Created by Julia Martcenko on 17/02/2025.
//

import SwiftUI

struct EditView: View {
	@Environment(\.dismiss) var dismiss

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
					dismiss()
				}
			}
		}
		.navigationBarBackButtonHidden(true)
	}
}

#Preview {
	EditView(habit: .constant(HabitModel(name: "Tiansdf", description: "Desdlkjsfl")))
}
