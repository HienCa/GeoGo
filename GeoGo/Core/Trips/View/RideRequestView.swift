//
//  RideRequestView.swift
//  GeoGo
//
//  Created by Nguyen Van Hien on 14/5/24.
//

import SwiftUI

struct RideRequestView: View {
    @State private var selectedRideType: RideType = .geoGoX
    @EnvironmentObject var locationViewModel: LocationSearchViewModel
    
    var body: some View {
        VStack{
            Capsule()
                .foregroundColor(Color(.systemGray5))
                .frame(width: 48, height: 6)
                .padding(.top, 8)
            //trip into view
            HStack{
                //indicator view
                VStack{
                    Circle()
                        .fill(Color(.systemGray3))
                        .frame(width: 6, height: 6)
                    
                    Rectangle()
                        .fill(Color(.systemGray3))
                        .frame(width: 1, height: 24)
                    
                    Rectangle()
                        .fill(.black)
                        .frame(width: 6, height: 6)
                }
                
                VStack(alignment: .leading, spacing: 24, content: {
                    HStack{
                        Text("Current location")
                            .font(.system(size: 16, weight: .semibold))
                            .foregroundColor(.gray)
                        
                        Spacer()
                        
                        Text(locationViewModel.pickUpTime ?? "")
                            .font(.system(size: 14, weight: .semibold))
                            .foregroundColor(.gray)
                        
                    }
                    .padding(.bottom, 10)
                    
                    HStack{
                        if let location = locationViewModel.selectedGeoGoLocation{
                            Text(location.title)
                                .font(.system(size: 16, weight: .semibold))
                                .foregroundColor(.gray)
                        }
                        
                        Spacer()
                        
                        Text(locationViewModel.dropOffTime ?? "")
                            .font(.system(size: 14, weight: .semibold))
                            .foregroundColor(.gray)
                    }
                })
                .padding(.leading, 8)

            }
            .padding()
            
            Divider()
            
            //ride type selection view
            Text("SUGGESTED RIDES")
                .font(.subheadline)
                .fontWeight(.semibold)
                .padding()
                .foregroundColor(.gray)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            ScrollView( .horizontal, content: {
                HStack(spacing: 12, content: {
                    ForEach(RideType.allCases, content: { type in
                        VStack(alignment: .leading, content: {
                            Image(type.imageName)
                                .resizable()
                                .scaledToFit()
                            
                            VStack(alignment: .leading, spacing: 4, content: {
                                Text(type.description)
                                    .font(.system(size: 14, weight: .semibold))
                                Text(locationViewModel.computeRidePrice(for: type).toCurrency())
                                    .font(.system(size: 14, weight: .semibold))
                            })
                            .padding()
                            
                        })
                        .frame(width: 112, height: 140)
                        .foregroundColor(type == selectedRideType ? .white : Color.theme.primaryTextColor)
                        .background(type == selectedRideType ? .blue : Color.theme.secondaryBackgroundColor)
                        .cornerRadius(10)
                        .scaleEffect(type == selectedRideType ? 1.25 : 1.0)
                        .onTapGesture {
                            withAnimation(.spring, {
                                selectedRideType = type
                            })
                        }
                    })
                })
            })
            .padding(.horizontal)

            Divider()
                .padding(.vertical, 8)
            
            //payment option view
            HStack(spacing: 12, content: {
                Text("Visa")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .padding(6)
                    .background(.blue)
                    .cornerRadius(4)
                    .foregroundColor(.white)
                    .padding(.horizontal)
                
                Text("**** 1234")
                    .fontWeight(.bold)
                
                Spacer()
                
                Image(systemName: "chevron.right")
                    .imageScale(.medium)
                    .padding()
            })
            .frame(height: 50)
            .background(Color.theme.secondaryBackgroundColor)
            .cornerRadius(10)
            .padding(.horizontal)
            
            //request ride button
            
            Button(action: {
                
            }, label: {
                Text("CONFIRM RIDE")
                    .fontWeight(.bold)
                    .frame(width: UIScreen.main.bounds.width - 32, height: 50)
                    .background(.blue)
                    .cornerRadius(10)
                    .foregroundColor(.white)
            })
            
            
        }
        
        .background(Color.theme.backgroundColor)
        .cornerRadius(16)
        .padding(.bottom, 24)
    }
}

#Preview {
    RideRequestView()
}
