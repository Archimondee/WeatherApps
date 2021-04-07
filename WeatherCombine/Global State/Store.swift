//
//  Store.swift
//  WeatherCombine
//
//  Created by Gilang Aditya R on 06/04/21.
//

import Foundation

import Foundation

class Store: ObservableObject {
	@Published var weatherList: [WeatherViewModel] = [WeatherViewModel]()
	@Published var selectedUnit: TemperatureUnit = .kelvin
	
	init(){
		selectedUnit = UserDefaults.standard.unit
	}
	func addWeather(_ weather: WeatherViewModel){
		weatherList.append(weather)
	}
	
}
