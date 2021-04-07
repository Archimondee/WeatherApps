//
//  Error.swift
//  WeatherCombine
//
//  Created by Gilang Aditya R on 06/04/21.
//

import Foundation

import Foundation
import Foundation

enum APIError {
	case decodingError
	case errorCode(Int)
	case unknown
}

extension APIError: LocalizedError {
	var errorDescription: String? {
		switch self {
			case .decodingError:
				return "Service object decoding was unsuccessful"
			case .errorCode(let code):
				return "\(code): Error"
			case .unknown:
				return "Uknown error"
		}
	}
}
