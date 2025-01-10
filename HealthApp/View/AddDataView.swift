//
//  AddDataView.swift
//  HealthCare
//
//  Created by Soumita on 09/01/25.
//


import SwiftUI
import CoreData

struct AddDataView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @Binding var isPresented: Bool
    @State private var metricType = "Heart Rate"
    @State private var value: String = ""
    @State private var timestamp = Date()
    @State private var showingAlert = false

    let metricTypes = ["Heart Rate", "Steps", "Water Intake"]

    var body: some View {
        NavigationView {
            Form {
                Picker("Metric Type", selection: $metricType) {
                    ForEach(metricTypes, id: \.self) { type in
                        Text(type)
                    }
                }

                TextField("Value", text: $value)
                    .keyboardType(.decimalPad)

                DatePicker("Timestamp", selection: $timestamp, displayedComponents: [.date, .hourAndMinute])

                Button("Save") {
                    if value.isEmpty {
                        showingAlert = true
                    } else {
                        addData()
                        showingAlert = true
                    }
                }
                .alert(isPresented: $showingAlert) {
                    Alert(
                        title: Text(value.isEmpty ? "Error" : "Success"),
                        message: Text(value.isEmpty ? "Value cannot be empty." : "Data saved successfully."),
                        dismissButton: .default(Text("OK"), action: {
                            if !value.isEmpty {
                                isPresented = false
                            }
                        })
                    )
                }
            }
            .navigationTitle("Add Data")
        }
    }

    private func addData() {
        let newData = HealthData(context: viewContext)
        newData.id = UUID()
        newData.metricType = metricType
        newData.value = Double(value) ?? 0.0
        newData.timestamp = timestamp

        do {
            try viewContext.save()
        } catch {
            print("Error saving data: \(error.localizedDescription)")
        }
    }
}
