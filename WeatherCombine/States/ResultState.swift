//
//  ResultState.swift
//  WeatherCombine
//
//  Created by Gilang Aditya R on 06/04/21.
//

import Foundation

enum ResultState {
	case loading
	case success(content: Weather)
	case failed(error: Error)
}
