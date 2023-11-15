//
//  File.swift
//  
//
//  Created by 최준영 on 2023/11/16.
//

import SwiftUI
import MapKit

class SchoolAnnotation: NSObject, AnnotationType {
    var annotationType: StringLiteralType {
        NSStringFromClass(Self.self)
    }
    var coordinate: CLLocationCoordinate2D
    var title: String?
    var subtitle: String?
    
    init(coordinate: CLLocationCoordinate2D, title: String? = nil, subtitle: String? = nil) {
        self.coordinate = coordinate
        self.title = title
        self.subtitle = subtitle
    }
}

class RestaurantAnnotation: NSObject, AnnotationType {
    var annotationType: StringLiteralType {
        NSStringFromClass(Self.self)
    }
    var coordinate: CLLocationCoordinate2D
    var title: String?
    var subtitle: String?
    
    init(coordinate: CLLocationCoordinate2D, title: String? = nil, subtitle: String? = nil) {
        self.coordinate = coordinate
        self.title = title
        self.subtitle = subtitle
    }
}
