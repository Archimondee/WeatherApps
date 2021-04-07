//
//  WeatherListScreen.swift
//  WeatherCombine
//
//  Created by Gilang Aditya R on 06/04/21.
//

import SwiftUI

enum Sheets: Identifiable {
	var id: UUID {
		return UUID()
	}
	
	case addNewCity
	case settings
}

struct WeatherListScreen: View {
	@State private var activeSheets: Sheets?
	@StateObject var viewModel = AddWeatherViewModel(service: WeatherService())
	@EnvironmentObject var store: Store
	var body: some View {
		List {
			ForEach(store.weatherList, id: \.id) { weather in
				WeatherCell(weather: weather)
			}
		}
		.listStyle(PlainListStyle())
		.sheet(item: $activeSheets, content: { (item) in
			switch item {
				case .addNewCity:
					AddCityScreen().environmentObject(store)
				case .settings:
					SettingsScreen().environmentObject(store)
			}
		})
		.navigationBarItems(leading: Button(action: {
			activeSheets = .settings
		}) {
			Image(systemName: "gearshape")
		}, trailing: Button(action: {
			activeSheets = .addNewCity
		}, label: {
			Image(systemName: "plus")
		}))
		.navigationTitle("Cities")
		.embedInNavigationView()
		
	}
}

struct WeatherListScreen_Previews: PreviewProvider {
	static var previews: some View {
		return WeatherListScreen().environmentObject(Store())
	}
}

struct WeatherCell: View {
	let weather: WeatherViewModel
	@EnvironmentObject var store: Store
	var body: some View {
		HStack {
			VStack(alignment: .leading, spacing: 15) {
				Text(weather.city)
					.fontWeight(.bold)
				HStack {
					Image(systemName: "sunrise")
					Text("\(weather.sunrise.formatAsString())")
				}
				HStack {
					Image(systemName: "sunset")
					Text("\(weather.sunset.formatAsString())")
				}
			}
			Spacer()
			URLImage(url: "https://api.openweathermap.org/img/w/\(weather.icon).png").frame(width: 50, height: 50)
			
			Text(String(format: "%0.f \(store.selectedUnit.displayText.prefix(1))", arguments: [weather.getTemperatureByUnit(unit: store.selectedUnit)]))
		}
		.padding()
		.background(Color(#colorLiteral(red: 0.9133135676, green: 0.9335765243, blue: 0.98070997, alpha: 1)))
		.clipShape(RoundedRectangle(cornerRadius: 10, style: /*@START_MENU_TOKEN@*/.continuous/*@END_MENU_TOKEN@*/))
		
	}
}

