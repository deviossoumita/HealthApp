//
//  EditDataView.swift
//  HealthCare
//
//  Created by Soumita on 09/01/25.
//


import SwiftUI
import CoreData

struct EditDataView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @Environment(\.presentationMode) private var presentationMode

    @State var data: HealthData
    @State private var metricType: String
    @State private var value: String
    @State private var timestamp: Date

    init(data: HealthData) {
        _data = State(initialValue: data)
        _metricType = State(initialValue: data.metricType ?? "")
        _value = State(initialValue: String(data.value))
        _timestamp = State(initialValue: data.timestamp ?? Date())
    }

    var body: some View {
        Form {
            Picker("Metric Type", selection: $metricType) {
                ForEach(["Heart Rate", "Steps", "Water Intake"], id: \.self) { type in
                    Text(type)
                }
            }

            TextField("Value", text: $value)
                .keyboardType(.decimalPad)

            DatePicker("Timestamp", selection: $timestamp, displayedComponents: [.date, .hourAndMinute])

            Button("Save") {
                saveData()
            }
        }
        .navigationTitle("Edit Data")
    }

    private func saveData() {
        data.metricType = metricType
        data.value = Double(value) ?? 0.0
        data.timestamp = timestamp

        do {
            try viewContext.save()
            presentationMode.wrappedValue.dismiss()
        } catch {
            print("Error saving data: \(error.localizedDescription)")
        }
    }
}
