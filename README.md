# Health App

## Overview
The HealthApp is a SwiftUI-based application designed to track and manage personal health metrics. Users can add, view, edit, and delete health data like heart rate, steps, and water intake. The app uses Core Data for data persistence and displays health trends using various types of charts.

## Features
- **Home Screen**: Displays visual health trends with charts (line, bar, and point charts).
- **Add Data**: Allows users to add health metrics (e.g., heart rate, steps, water intake) with timestamps.
  - Picker for selecting metric types.
  - Text field for entering values (mandatory).
  - Timestamp picker for date and time.
  - Displays an alert upon successful save.
  - Automatically dismisses after saving.
- **View Data**: Shows a list of saved health data.
  - Filter data by time ranges (All, Morning, Afternoon, Evening).
  - Toggle to sort by metric values in ascending/descending order.
  - Displays both date and time for each entry.
  - Context menu for editing or deleting data.
- **Edit Data**: Modify previously entered health data.
- **Core Data Integration**: Ensures data persistence across app sessions.
- **Charts**: Displays health data trends using Swift Charts.

## Technologies Used
- **SwiftUI**: For building the user interface.
- **Core Data**: For data storage and management.
- **Charts**: For data visualization.

## Requirements
- iOS 16.0 or later
- Xcode 14.0 or later

## Installation
1. Clone the repository:
   ```bash
   git clone https://github.com/deviossoumita/HealthApp.git
   ```
2. Open the project in Xcode:
   ```bash
   cd HealthCareApp
   open HealthCareApp.xcodeproj
   ```
3. Build and run the project on a simulator or device.

## Usage
### Home Screen
1. View health trends in line, bar, and point charts.

### Adding Data
1. Tap the **Add** button in the navigation bar.
2. Fill in the metric type, value, and timestamp.
3. Press **Save** to store the data.
4. An alert will confirm the save, and the screen will dismiss.

### Viewing Data
1. Tap the **View** button in the navigation bar.
2. Use the picker to filter data by time ranges.
3. Toggle the sorting order by metric value.
4. Tap and hold a list item to edit or delete it.

### Editing Data
1. Select "Edit" from the context menu of a list item.
2. Modify the fields and press **Save**.

### Deleting Data
1. Select "Delete" from the context menu of a list item.
2. The item will be removed from the list.

## Project Structure
- **ContentView.swift**: Main entry point for the app’s UI.
- **ChartView.swift**: Displays various types of charts.
- **AddDataView.swift**: Handles adding new health data.
- **ViewDataView.swift**: Displays and manages saved health data.
- **EditDataView.swift**: Provides UI for editing existing data.
- **HealthData.swift**: Core Data model class.
- **PersistenceController.swift**: Core Data stack management.

## License
This project is licensed under the MIT License. See the LICENSE file for details.

