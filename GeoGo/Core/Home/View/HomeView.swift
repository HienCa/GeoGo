//
//  HomeView.swift
//  GeoGo
//
//  Created by Nguyen Van Hien on 13/5/24.
//

import SwiftUI

struct HomeView: View {
    @State private var mapState = MapViewState.noInput
    @EnvironmentObject var locationViewModel: LocationSearchViewModel
    var body: some View {
        ZStack(alignment: .bottom, content: {
            ZStack(alignment: .top, content: {
                
                GeoGoMapViewRepresentable(mapState:$mapState )
                    .ignoresSafeArea()
                
                if mapState == .searchingForLocation{
                    LocationSearchView(mapState: $mapState)
                }else if mapState == .noInput{
                    LocationSearchActivationView()
                        .padding(.top, 72)
                        .onTapGesture {
                            withAnimation(.spring, {
                                mapState = .searchingForLocation
                            })
                        }
                }
                
                MapViewActionButton(mapState: $mapState)
                    .padding(.leading)
                    .padding(.top, 4)
            })
            
            if mapState == .locationSelected || mapState == .polylineAdded{
                RideRequestView()
                    .transition(.move(edge: .bottom))
            }
        })
        .edgesIgnoringSafeArea(.bottom)
        .onReceive(LocationManager.shared.$userLocation, perform: { location in
            if let location = location{
                print("DEBUG: User location in home view is \(location)")
                locationViewModel.userLocation = location
            }
        })
    }
}

#Preview {
    HomeView()
}
