//
//  SettingsScreen.swift
//  WeatherCombine
//
//  Created by Gilang Aditya R on 06/04/21.
//

import SwiftUI

struct SettingsScreen: View {
	
	@Environment(\.presentationMode) var mode: Binding<PresentationMode>
	@AppStorage("unit") private var selectedUnit: TemperatureUnit = .kelvin
	@EnvironmentObject var store: Store
	
	var body: some View {
		VStack {
			Picker(selection: $selectedUnit, label: Text("Select temperature unit?")) {
				ForEach(TemperatureUnit.allCases, id: \.self) {
					Text("\($0.displayText)" as String)
				}
			}
			.pickerStyle(SegmentedPickerStyle())
			
			Spacer()
		}
		.padding()
		.navigationTitle("Settings")
		.navigationBarItems(trailing: Button("Done") {
			mode.wrappedValue.dismiss()
			store.selectedUnit = selectedUnit
		})
		.embedInNavigationView()
	}
}

struct SettingsScreen_Previews: PreviewProvider {
	static var previews: some View {
		SettingsScreen().environmentObject(Store())
	}
}
