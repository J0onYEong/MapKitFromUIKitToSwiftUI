//
//  File.swift
//  
//
//  Created by 최준영 on 2023/11/16.
//

import MapKit

// MARK: - Custom MKAnnotation
protocol AnnotationClassType: MKAnnotation {
    var identifier: String { get }
}

extension AnnotationClassType {
    var identifier: String { NSStringFromClass(Self.self) }
}
