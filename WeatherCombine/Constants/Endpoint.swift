//
//  Endpoint.swift
//  WeatherCombine
//
//  Created by Gilang Aditya R on 06/04/21.
//

import Foundation

protocol APIBuilder {
	var urlRequest: URLRequest { get }
	var baseUrl: URL { get }
	var path: String { get }
}

enum WeatherAPI {
	case getWeatherByCity(city:String)
	case getWeatherUrlAsStringByIcon(icon: String)
}

extension WeatherAPI: APIBuilder {
	
	var urlRequest: URLRequest {
		let uri = URL(string: "\(self.baseUrl)\(self.path)")!
		return URLRequest(url: uri)
	}
	
	var baseUrl: URL {
		return URL(string: "https://api.openweathermap.org")!
	}
	
	var path: String {
		switch self {
			case .getWeatherByCity(let city):
				return "/data/2.5/weather?q=\(city.escaped())&appid=ef0fd9866ca027e0dca474cee84c53be"
				//return "/data/2.5/weather?q=Bekasi&appid=ef0fd9866ca027e0dca474cee84c53be"
			case .getWeatherUrlAsStringByIcon(let icon):
				return "\(self.baseUrl)/img/w/\(icon).png"
		}
	}
}
