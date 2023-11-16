//
//  File.swift
//  
//
//  Created by 최준영 on 2023/11/16.
//

import MapKit
import SwiftUI

/// Circular Imae Annotation의 데이터를 담고있는 MKAnnotation의 상위 타입이다.
class CIAnnotationWithSwiftUI: NSObject, AnnotationClassType {
    var coordinate: CLLocationCoordinate2D
    var title: String?
    var subtitle: String?
    
    //name for image resource
    var imageName: String
    
    init(coordinate: CLLocationCoordinate2D, title: String? = nil, subtitle: String? = nil, imageName: String) {
        self.coordinate = coordinate
        self.title = title
        self.subtitle = subtitle
        self.imageName = imageName
    }
}


/// SwiftUI View로 CIAnnotationViewWithSwiftUIView에서 UIView로 전환되어 사용된다.
fileprivate struct CircleImageView: View {
    var imageName: String
    
    var image: Image {
        let path = Bundle.module.path(forResource: "japanStreet", ofType: "jpg")!
        let uiImage = UIImage(named: path)!
        return Image(uiImage: uiImage)
    }

    var body: some View {
        image
            .resizable()
            .scaledToFit()
            .clipShape(Circle())
            .aspectRatio(1, contentMode: .fit)
            .foregroundStyle(.cyan)
            .padding(3)
            .background(
                Circle()
                    .fill(.indigo)
            )
            .frame(width: 100, height: 100)
    }
}


/// SwiftUI View를 UIView로 변경하는 역할을 한다. 해당 뷰(SwiftUI View)의 Configuration이 가능하다.
class CIAnnotationViewWithSwiftUIView: MKAnnotationView {
    
    override init(annotation: MKAnnotation?, reuseIdentifier: String?) {
        super.init(annotation: annotation, reuseIdentifier: reuseIdentifier)
        
        setUp()
    }
    
    required init?(coder aDecoder: NSCoder) {
        
        fatalError("init(coder:) has not been implemented!")
    }
    
    private func setUp() {
        guard let imageAnnotation = annotation as? CIAnnotationWithSwiftUI else {
            preconditionFailure("잘못된 Annotation타입이 전달되었습니다.")
        }
        guard let circularView = UIHostingController(rootView: CircleImageView(imageName: imageAnnotation.imageName)).view else {
            preconditionFailure("SwiftUI View가 UIView로 전환되지 못했습니다.")
        }
        
        self.addSubview(circularView)
        
        NSLayoutConstraint.activate([
            circularView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            circularView.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        ])
    }
}

