//
//  String+Extensions.swift
//  WeatherCombine
//
//  Created by Gilang Aditya R on 06/04/21.
//

import Foundation

extension String {
	
	func escaped() -> String {
		return self.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) ?? self
	}
	
}
