//
//  File.swift
//  
//
//  Created by 최준영 on 2023/11/16.
//

import MapKit

// MARK: - Custom MKAnnotation
// MKAnnotation이 분류가능하도록 annotationType 연산프로퍼티를 추가
protocol AnnotationType: MKAnnotation {
    var annotationType: StringLiteralType { get }
}
