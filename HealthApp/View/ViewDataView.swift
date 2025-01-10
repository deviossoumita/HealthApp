//
//  ViewDataView.swift
//  HealthCare
//
//  Created by Soumita on 09/01/25.
//


import SwiftUI
import CoreData

struct ViewDataView: View {
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \HealthData.timestamp, ascending: false)],
        animation: .default
    ) private var healthData: FetchedResults<HealthData>

    @State private var filter: String = "All"
    @State private var sortAscending: Bool = false
    @State private var showingEditDeleteSheet: Bool = false
    @State private var selectedData: HealthData? = nil
    
    @Environment(\.managedObjectContext) private var viewContext

    let timeRanges = ["All", "Morning", "Afternoon", "Evening"]

    var body: some View {
        NavigationView {
            VStack {
                Picker("Filter", selection: $filter) {
                    ForEach(timeRanges, id: \.self) { range in
                        Text(range)
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
                .padding()

                Toggle("Sort by Metric Value Ascending", isOn: $sortAscending)
                    .padding()

                List(filteredData.sorted { sortAscending ? $0.value < $1.value : $0.value > $1.value }) { data in
                    VStack(alignment: .leading) {
                        Text("\(data.metricType ?? "") - \(data.value, specifier: "%.2f")")
                        Text(data.timestamp ?? Date(), style: .date)
                            .font(.caption)
                            .foregroundColor(.gray)
                        Text(data.timestamp ?? Date(), style: .time)
                            .font(.caption)
                            .foregroundColor(.gray)
                    }
                    .contextMenu {
                        Button("Edit") {
                            selectedData = data
                            showingEditDeleteSheet = true
                        }
                        Button("Delete") {
                            deleteData(data)
                        }
                    }
                }
            }
            .sheet(item: $selectedData) { data in
                EditDataView(data: data).environment(\.managedObjectContext, viewContext)
            }
            .navigationTitle("View Data")
        }
    }

    private var filteredData: [HealthData] {
        let sortedData = healthData.sorted {
            sortAscending ? $0.value < $1.value : $0.value > $1.value
        }

        switch filter {
        case "Morning":
            return sortedData.filter { Calendar.current.component(.hour, from: $0.timestamp ?? Date()) < 12 }
        case "Afternoon":
            return sortedData.filter { Calendar.current.component(.hour, from: $0.timestamp ?? Date()) >= 12 && Calendar.current.component(.hour, from: $0.timestamp ?? Date()) < 18 }
        case "Evening":
            return sortedData.filter { Calendar.current.component(.hour, from: $0.timestamp ?? Date()) >= 18 }
        default:
            return sortedData
        }
    }

    private func deleteData(_ data: HealthData) {
        viewContext.delete(data)

        do {
            try viewContext.save()
        } catch {
            print("Error deleting data: \(error.localizedDescription)")
        }
    }
}
