//
//  File.swift
//  
//
//  Created by 최준영 on 2023/11/16.
//

import MapKit

// MARK: - SchoolAnnotation
class SchoolAnnotationView: MKAnnotationView {
    
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
        let circularView = UIView()
        circularView.translatesAutoresizingMaskIntoConstraints = false
        circularView.backgroundColor = UIColor.black
        
        NSLayoutConstraint.activate([
            circularView.centerXAnchor.constraint(equalTo: circularView.centerXAnchor),
            circularView.centerYAnchor.constraint(equalTo: circularView.centerYAnchor),
            circularView.widthAnchor.constraint(equalToConstant: bounds.width),
            circularView.heightAnchor.constraint(equalTo: circularView.widthAnchor)
        ])
        
        // Make the view circular
        circularView.layer.cornerRadius = bounds.width / 2
        circularView.clipsToBounds = true
        
        let imageView = UIImageView(image: UIImage(systemName: "chevron.down.circle.fill"))
        circularView.addSubview(imageView)
        imageView.frame = bounds
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.tintColor = .white
        
        NSLayoutConstraint.activate([
            imageView.leadingAnchor.constraint(equalTo: imageView.leadingAnchor, constant: 3),
            imageView.trailingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: -3),
            imageView.topAnchor.constraint(equalTo: imageView.topAnchor, constant: 3),
            imageView.bottomAnchor.constraint(equalTo: imageView.bottomAnchor, constant: -3),
            imageView.centerXAnchor.constraint(equalTo: circularView.centerXAnchor),
            imageView.centerYAnchor.constraint(equalTo: circularView.centerYAnchor)
        ])
        
        self.addSubview(circularView)
    }
}


// MARK: - RestaurantAnnotation
class RestaurantAnnotationView: MKAnnotationView {
    
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
        let imageView = UIImageView(image: UIImage(systemName: "cup.and.saucer.fill"))
        imageView.frame = bounds
        self.addSubview(imageView)
    }
}
