//
//  GeoGoApp.swift
//  GeoGo
//
//  Created by Nguyen Van Hien on 13/5/24.
//

import SwiftUI

@main
struct GeoGoApp: App {
    @StateObject var locationViewModel = LocationSearchViewModel()
    var body: some Scene {
        WindowGroup {
            HomeView().environmentObject(locationViewModel)
        }
    }
}
