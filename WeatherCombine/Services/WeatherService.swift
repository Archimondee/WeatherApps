//
//  WeatherService.swift
//  WeatherCombine
//
//  Created by Gilang Aditya R on 06/04/21.
//

import Foundation
import Combine

class WeatherService {
	func request(from endpoint: WeatherAPI) -> AnyPublisher<WeatherResponse, APIError> {
		return URLSession.shared.dataTaskPublisher(for: endpoint.urlRequest)
			.receive(on: DispatchQueue.main)
			.mapError{_ in APIError.unknown}
			.flatMap{ data, response -> AnyPublisher<WeatherResponse, APIError> in
				guard let response = response as? HTTPURLResponse else {
					return Fail(error: APIError.unknown).eraseToAnyPublisher()
				}
				
				if(200...299).contains(response.statusCode){
					let jsonDecoder = JSONDecoder()
					return Just(data).decode(type: WeatherResponse.self, decoder: jsonDecoder)
						.mapError{_ in APIError.decodingError}
						.eraseToAnyPublisher()
				}else {
					return Fail(error: APIError.errorCode(response.statusCode)).eraseToAnyPublisher()
				}
			}.eraseToAnyPublisher()
	}
}
