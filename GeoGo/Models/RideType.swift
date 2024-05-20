//
//  RideType.swift
//  GeoGo
//
//  Created by Nguyen Van Hien on 14/5/24.
//

import Foundation
enum RideType: Int, CaseIterable, Identifiable{
    case geoGoX
    case black
    case geoGoXL
    
    var id: Int{
        return rawValue
    }
    
    var description: String{
        switch self{
        case .geoGoX: return "GeoGoX"
        case .black: return "GeoGoBlack"
        case .geoGoXL: return "GeoGoXL"
        }
    }
    
    var imageName: String{
        switch self{
        case .geoGoX: return "lamborghini"
        case .black: return "veneno"
        case .geoGoXL: return "vinfast"
        }
    }
    
    var baseFare: Double{
        switch self{
        case .geoGoX: return 5
        case .black: return 20
        case .geoGoXL: return 10
        }
    }
    
    func computerPrice(for distanceInMeters: Double) -> Double{
        let distanceInMiles = distanceInMeters / 1600
        
        switch self{
        case .geoGoX: return distanceInMiles * 1.5 + baseFare
        case .black: return distanceInMiles * 2.0 + baseFare
        case .geoGoXL: return distanceInMiles * 1.75 + baseFare
        }
    }
    
}
