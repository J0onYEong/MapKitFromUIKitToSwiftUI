//
//  File.swift
//  
//
//  Created by 최준영 on 2023/11/16.
//

import SwiftUI
import MapKit

/// Circular Imae Annotation의 데이터를 담고있는 MKAnnotation의 상위 타입이다.
public class CIAnnotationWithSwiftUI: NSObject, AnnotationClassType {
    public var coordinate: CLLocationCoordinate2D
    public var title: String?
    public var subtitle: String?
    
    //name for image resource
    public var uiImage: UIImage
    
    public init(coordinate: CLLocationCoordinate2D, title: String? = nil, subtitle: String? = nil, uiImage: UIImage) {
        self.coordinate = coordinate
        self.title = title
        self.subtitle = subtitle
        self.uiImage = uiImage
    }
}
