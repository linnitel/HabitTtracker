//
//  ContentView.swift
//  HabitTracker
//
//  Created by Julia Martcenko on 17/02/2025.
//

import SwiftUI

struct ContentView: View {
	@State var habitsViewModel = HabitViewModel()

	@State private var showAddHabitView: Bool = false

    var body: some View {
		NavigationStack {
			List {
				ForEach(habitsViewModel.habits) { habit in
					NavigationLink (destination: {
						EditView(habitsViewModel: habitsViewModel, habitItem: habit, name: habit.name, description: habit.description, timesDone: habit.timesDone)
					}, label: {
						HabitItemView(habit: habit)
					})
				}
				.onDelete(perform: removeItems)

			}
			.navigationBarTitle("Habits")
			.toolbar {
				ToolbarItem(placement: .navigationBarTrailing) {
					Image(systemName: "plus").onTapGesture {
						showAddHabitView = true
					}
				}
			}
			.popover(isPresented: $showAddHabitView) {
				AddHabitView(habits: habitsViewModel)
			}
		}
    }

	func removeItems(at offsets: IndexSet) {
		habitsViewModel.habits.remove(atOffsets: offsets)
	}
}

struct HabitItemView: View {
	var habit: HabitModel

	var body: some View {
		HStack {
			Image(systemName: "\(habit.timesDone).circle")
				.font(.largeTitle)
			VStack {
				Text(habit.name)
					.font(.title2)
				if habit.description != "" {
					Text(habit.description)
						.font(.subheadline)
				}
			}
		}
	}
}

struct AddHabitView: View {
	@Environment(\.dismiss) var dismiss

	var habits: HabitViewModel

	@State private var name: String = ""
	@State private var description: String = ""

	var body: some View {
		VStack {
			VStack {
				TextField("Title", text: $name)
					.font(.largeTitle)
				TextField("Description", text: $description)
					.frame(minHeight: 80, alignment: .top)
				Button("Save") {
					if name != "" {
						let habit = HabitModel(name: name, description: description)
						habits.habits.append(habit)
					}
					dismiss()
				}
				.padding()
				.frame(maxWidth: .infinity, alignment: .center)
				.foregroundStyle(.white)
				.background(Color(red: 0, green: 0, blue: 0.5))
				.clipShape(RoundedRectangle(cornerRadius: 15))
				Spacer()
			}
			.padding(40)

		}
	}
}

#Preview {
    ContentView()
}
