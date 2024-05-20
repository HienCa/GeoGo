//
//  LocationSearchActivationView.swift
//  GeoGo
//
//  Created by Nguyen Van Hien on 13/5/24.
//

import SwiftUI

struct LocationSearchActivationView: View {
    var body: some View {
        HStack{
            Rectangle()
                .fill(Color.black)
                .frame(width: 8, height: 8)
                .padding(.horizontal)
            Text("Where to?")
            Spacer()
        }
        .frame(width: UIScreen.main.bounds.width - 64, height: 50)
        .background(Rectangle()
            .fill(Color.white)
            .shadow(color: .black, radius: 6)
        )
    }
}

#Preview {
    LocationSearchActivationView()
}
