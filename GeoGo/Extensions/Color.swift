//
//  Color.swift
//  GeoGo
//
//  Created by Nguyen Van Hien on 14/5/24.
//

import Foundation
import SwiftUI
extension Color{
    static let theme = ColorTheme()
}

struct ColorTheme{
    let backgroundColor = Color("BackgroundColor")
    let secondaryBackgroundColor = Color("SecondaryBackgroundColor")
    let primaryTextColor = Color("PrimaryTextColor")
}
