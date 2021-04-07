//
//  Date+Extensions.swift
//  WeatherCombine
//
//  Created by Gilang Aditya R on 06/04/21.
//

import Foundation


extension Date {
	
	func formatAsString() -> String {
		let formatter = DateFormatter()
		formatter.dateFormat = "hh:mm a"
		return formatter.string(from: self)
	}
	
}
