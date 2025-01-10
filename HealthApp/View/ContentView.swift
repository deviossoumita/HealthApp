//
//  ContentView.swift
//  HealthApp
//
//  Created by Soumita on 09/01/25.
//

import SwiftUI
import CoreData
import Charts

struct ContentView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @State private var showingAddDataView = false
    @State private var showingViewDataView = false

    var body: some View {
        NavigationView {
            VStack {
                ChartView()
                Spacer()
            }
            .navigationTitle("Health Tracker")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Add") {
                        showingAddDataView = true
                    }
                }
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("View") {
                        showingViewDataView = true
                    }
                }
            }
            .sheet(isPresented: $showingAddDataView) {
                AddDataView(isPresented: $showingAddDataView).environment(\.managedObjectContext, viewContext)
            }
            .sheet(isPresented: $showingViewDataView) {
                ViewDataView().environment(\.managedObjectContext, viewContext)
            }
        }
    }
}
