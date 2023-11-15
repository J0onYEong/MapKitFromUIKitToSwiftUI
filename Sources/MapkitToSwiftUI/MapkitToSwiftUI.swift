import SwiftUI
import UIKit
import MapKit


// MARK: - Coordinator
class MkMapViewCoordinator: NSObject, MKMapViewDelegate {
    
    var mapView: MKMapView?
    
    override init() {
        super.init()
        registerAnnotation()
    }
    
    private func registerAnnotation() {
        guard let mapView = self.mapView else { return }
        mapView.register(SchoolAnnotationView.self, forAnnotationViewWithReuseIdentifier: NSStringFromClass(SchoolAnnotationView.self))
    }
    
    //TODO: SwiftUI뷰를 등록할 수 있도록 구현
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        
        let someAnnotation = annotation as! AnnotationType
        
        switch someAnnotation.annotationType {
        case NSStringFromClass(SchoolAnnotation.self):
            return SchoolAnnotationView(annotation: annotation, reuseIdentifier: NSStringFromClass(SchoolAnnotationView.self))
        case NSStringFromClass(RestaurantAnnotation.self):
            return RestaurantAnnotationView(annotation: annotation, reuseIdentifier: NSStringFromClass(RestaurantAnnotationView.self))
        default:
            return nil
        }
    }
}

// MARK: - UIViewRepresentable
struct MapkitView: UIViewRepresentable {
    
    typealias UIViewType = MKMapView
    
    init() { }
    
    func makeUIView(context: Context) -> MKMapView {
        let mapView = MKMapView()
        mapView.delegate = context.coordinator
        context.coordinator.mapView = mapView
        
        // Annotation추가
        let annotation1 = SchoolAnnotation(coordinate: CLLocationCoordinate2D(latitude: 37.5507563, longitude: 126.9254901))
        annotation1.title = "Hongik"
        annotation1.subtitle = "School"
        
        let annotation2 = RestaurantAnnotation(coordinate: CLLocationCoordinate2D(latitude: 37.5474489, longitude: 126.922586))
        annotation2.title = "Ramen Truck"
        annotation2.subtitle = "Restaurant"
        
        mapView.addAnnotations([
            annotation1,
            annotation2
        ])
        
        return mapView
    }
    
    func makeCoordinator() -> MkMapViewCoordinator {
        MkMapViewCoordinator()
    }
    
    func updateUIView(_ uiView: MKMapView, context: Context) { }
}

public struct MapKitViewView: View {
    
    public init() { }
    
    public var body: some View {
        MapkitView()
    }
}




#Preview {
    VStack {
        MapkitView()
    }
}
