//
//  AddWeatherViewModel.swift
//  WeatherCombine
//
//  Created by Gilang Aditya R on 06/04/21.
//

import Foundation
import Combine

class AddWeatherViewModel: ObservableObject {
	private let service: WeatherService
	var city: String = ""
	@Published private(set) var weather: Weather
	private var cancellables = Set<AnyCancellable>()
	@Published private(set) var state: ResultState = .loading
	
	init(service: WeatherService){
		self.service = service
		self.weather = Weather(city: "", temperature: 1, icon: "", sunrise: Date(timeIntervalSince1970: 1617712527), sunset: Date(timeIntervalSince1970: 1617712527))
	}
	
	func save(completion: @escaping(WeatherViewModel)-> Void){
		self.state = .loading
		
		let cancellable = service.request(from: .getWeatherByCity(city: city))
			.sink { res in
				switch res {
					case .finished:
						self.state = .success(content: self.weather)
					case .failure(let error):
						self.state = .failed(error: error)
				}
			} receiveValue: { (response) in
				self.weather = response.weather
				completion(WeatherViewModel(weather: response.weather))
			}
		self.cancellables.insert(cancellable)
	}
}
