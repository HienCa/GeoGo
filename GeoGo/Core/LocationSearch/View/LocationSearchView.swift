//
//  LocationSearchView.swift
//  GeoGo
//
//  Created by Nguyen Van Hien on 13/5/24.
//

import SwiftUI

struct LocationSearchView: View {
    @State private var startLocationText = ""
    @Binding var mapState: MapViewState
    @EnvironmentObject var viewModel: LocationSearchViewModel
    
    var body: some View {
        VStack{
            //header
            HStack{
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
                
                VStack{
                    TextField("Current location", text: $startLocationText)
                        .frame(height: 32)
                        .backgroundStyle(Color(.systemGroupedBackground))
                        .padding(.trailing)
                    TextField("Where to?", text: $viewModel.queryFragment)
                        .frame(height: 32)
                        .backgroundStyle(Color(.systemGroupedBackground))
                        .padding(.trailing)
                }

            }
            .padding(.horizontal)
            .padding(.top, 64)
            
            Divider()
                .padding(.vertical)
            
            //list view
            ScrollView{
                VStack(alignment: .leading, content: {
                    ForEach(viewModel.results, id: \.self){ result in
                        LocationSearchResultCell(title: result.title, subtitle: result.subtitle)
                            .onTapGesture {
                                withAnimation(.spring, {
                                    viewModel.selectLocation(result)
                                    mapState = .locationSelected
                                })
                                
                            }
                    }
                })
            }
        }
        .background(Color.theme.backgroundColor)
        .background(.white)
    }
}

#Preview {
    LocationSearchView(mapState: .constant(.searchingForLocation))
}
