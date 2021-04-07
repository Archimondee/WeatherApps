//
//  WeatherViewModel.swift
//  WeatherCombine
//
//  Created by Gilang Aditya R on 06/04/21.
//

import Foundation

struct WeatherViewModel {
	let weather: Weather
	
	let id = UUID()
	
	func getTemperatureByUnit(unit: TemperatureUnit) -> Double {
		switch unit {
			case .kelvin:
				return weather.temperature
			case .celsius:
				return weather.temperature - 273.15
			case .fahrenheit:
				return 1.8 * (weather.temperature - 273) + 32
		}
	}

	
	var temperature: Double {
		return weather.temperature
	}
	
	var city: String {
		return weather.city
	}
	
	var icon: String {
		return weather.icon
	}
	
	var sunrise: Date {
		return weather.sunrise
	}
	
	var sunset: Date {
		return weather.sunset
	}
}
