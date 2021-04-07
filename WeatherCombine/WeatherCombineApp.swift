//
//  WeatherCombineApp.swift
//  WeatherCombine
//
//  Created by Gilang Aditya R on 06/04/21.
//

import SwiftUI

@main
struct WeatherCombineApp: App {
    var body: some Scene {
        WindowGroup {
					WeatherListScreen().environmentObject(Store())
        }
    }
}
