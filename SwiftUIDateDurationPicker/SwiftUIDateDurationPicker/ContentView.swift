//
//  ContentView.swift
//  SwiftUIDateDurationPicker
//
//  Created by Toomas Vahter on 05.02.2022.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = ViewModel()
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    HStack {
                        Text("Remind me in every:")
                        Spacer()
                        Text("\(viewModel.selection.value) \(viewModel.selection.unit.rawValue)")
                    }
                    .contentShape(Rectangle())
                    .onTapGesture {
                        withAnimation {
                            viewModel.isPickerVisible.toggle()
                        }
                    }
                    if viewModel.isPickerVisible {
                        DateDurationPicker(selection: $viewModel.selection, values: Array(1..<100), units: DateDuration.Unit.allCases)
                    }
                }
            }
            .navigationTitle("Reminders")
        }
    }
}

extension ContentView {
    final class ViewModel: ObservableObject {
        @Published var selection = DateDuration(value: 1, unit: .days)
        @Published var isPickerVisible = false
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

