//
//  Weather.swift
//  WeatherCombine
//
//  Created by Gilang Aditya R on 06/04/21.
//

import Foundation

struct WeatherResponse: Decodable {
	let name: String
	let weather: Weather
	let icon: [WeatherIcon]
	let sys: Sys
	
	private enum CodingKeys: String, CodingKey {
		case name
		case weather = "main"
		case icon = "weather"
		case sys = "sys"
	}
	
	enum WeatherKeys: String, CodingKey {
		case temperature = "temp"
	}
	
	init(from decoder: Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)
		let weatherContainer = try container.nestedContainer(keyedBy: WeatherKeys.self, forKey: .weather)
		let temperature = try weatherContainer.decode(Double.self, forKey: .temperature)
		
		icon = try container.decode([WeatherIcon].self, forKey: .icon)
		sys = try container.decode(Sys.self, forKey: .sys)
		name = try container.decode(String.self, forKey: .name)
		
		weather = Weather(city: name, temperature: temperature, icon: icon.first!.icon, sunrise: sys.sunrise, sunset: sys.sunset)
	}
}

struct Weather: Decodable {
	let city: String
	let temperature: Double
	let icon: String
	let sunrise: Date
	let sunset: Date
}

struct WeatherIcon: Decodable{
	let main: String
	let description: String
	let icon: String
}

struct Sys: Decodable{
	let sunrise: Date
	let sunset: Date
	
	private enum CodingKeys: String, CodingKey {
		case sunrise = "sunrise"
		case sunset = "sunset"
	}
	
	init(from decoder: Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)
		let sunsetTimeInterval = try container.decode(Int32.self, forKey: .sunset)
		let sunriseTimeInterval = try container.decode(Int32.self, forKey: .sunrise)
		
		sunset = Date(timeIntervalSince1970: TimeInterval(sunsetTimeInterval))
		sunrise = Date(timeIntervalSince1970: TimeInterval(sunriseTimeInterval))
	}
}
