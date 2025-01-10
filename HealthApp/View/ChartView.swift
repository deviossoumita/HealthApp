//
//  ChartView.swift
//  HealthCare
//
//  Created by Soumita on 09/01/25.
//

import SwiftUI
import CoreData
import Charts

// Chart View
struct ChartView: View {
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \HealthData.timestamp, ascending: false)],
        animation: .default
    ) private var healthData: FetchedResults<HealthData>

    var body: some View {
        VStack {
            if healthData.isEmpty {
                VStack {
                    Image(systemName: "chart.bar")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100, height: 100)
                        .foregroundColor(.gray)
                    Text("No data available")
                        .font(.headline)
                        .foregroundColor(.gray)
                }
                .padding()
            } else {
                Text("Line Chart")
                    .font(.headline)
                Chart(healthData) { data in
                    LineMark(
                        x: .value("Time", data.timestamp ?? Date()),
                        y: .value("Value", data.value)
                    )
                }
                .padding()
                
                Text("Bar Chart")
                    .font(.headline)
                Chart(healthData) { data in
                    BarMark(
                        x: .value("Time", data.timestamp ?? Date()),
                        y: .value("Value", data.value)
                    )
                }
                .padding()
                
                Text("Point Chart")
                    .font(.headline)
                Chart(healthData) { data in
                    PointMark(
                        x: .value("Time", data.timestamp ?? Date()),
                        y: .value("Value", data.value)
                    )
                }
                .padding()
            }
        }
    }
}
