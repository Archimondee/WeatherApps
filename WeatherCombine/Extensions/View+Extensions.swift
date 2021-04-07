//
//  View+Extensions.swift
//  WeatherCombine
//
//  Created by Gilang Aditya R on 06/04/21.
//

import Foundation
import SwiftUI

extension View {
	
	func embedInNavigationView() -> some View {
		return NavigationView { self }
	}
	
}
