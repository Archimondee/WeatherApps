//
//  UserDefaults+Extensions.swift
//  WeatherCombine
//
//  Created by Gilang Aditya R on 06/04/21.
//

import Foundation

enum TemperatureUnit: String, CaseIterable, Identifiable {
	
	var id: String {
		return rawValue
	}
	
	case celsius
	case fahrenheit
	case kelvin
}

extension TemperatureUnit {
	
	var displayText: String {
		switch self {
			case .celsius:
				return "Celsius"
			case .fahrenheit:
				return "Fahrenheit"
			case .kelvin:
				return "Kelvin"
		}
	}
	
}

extension UserDefaults {
	
	var unit: TemperatureUnit {
		guard let value = self.value(forKey: "unit") as? String else {
			return .kelvin
		}
		return TemperatureUnit(rawValue: value) ?? .kelvin
	}
	
}


