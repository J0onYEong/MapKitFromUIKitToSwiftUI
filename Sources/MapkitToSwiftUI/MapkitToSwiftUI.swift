import SwiftUI
import UIKit
import MapKit


// MARK: - Test Annotation(UIView)
class TestAnnotation: MKAnnotationView {
    
    override init(annotation: MKAnnotation?, reuseIdentifier: String?) {
        super.init(annotation: annotation, reuseIdentifier: reuseIdentifier)
        
        frame = CGRect(x: 0, y: 0, width: 25, height: 25)
        centerOffset = CGPoint(x: 0, y: -frame.size.height / 2)
        setUp()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented!")
    }
    
    private func setUp() {
        let imageView = UIImageView(image: UIImage(systemName: "chevron.down.circle.fill"))
        imageView.frame = bounds
        self.addSubview(imageView)
    }
}



// MARK: - Coordinator
class MkMapViewCoordinator: NSObject, MKMapViewDelegate {
    
    var mapView: MKMapView?
    
    override init() {
        super.init()
        registerAnnotation()
    }
    
    private func registerAnnotation() {
        guard let mapView = self.mapView else { return }
        mapView.register(TestAnnotation.self, forAnnotationViewWithReuseIdentifier: NSStringFromClass(TestAnnotation.self))
    }
    
    //TODO: SwiftUI뷰를 등록할 수 있도록 구현
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        switch annotation {
        case is MKPointAnnotation:
            return TestAnnotation(annotation: annotation, reuseIdentifier: NSStringFromClass(TestAnnotation.self))
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
        let testAnnotation = MKPointAnnotation()
        testAnnotation.title = "Hongik Univ"
        testAnnotation.coordinate = CLLocationCoordinate2D(latitude: 37.5507563, longitude: 126.9254901)
        
        mapView.addAnnotation(testAnnotation)
        
        return mapView
    }
    
    func makeCoordinator() -> MkMapViewCoordinator {
        MkMapViewCoordinator()
    }
    
    func updateUIView(_ uiView: MKMapView, context: Context) {
        
    }
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
