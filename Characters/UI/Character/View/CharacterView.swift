//
//  CharacterView.swift
//  Characters
//
//  Created by stimLite on 02.07.2022.
//

import UIKit

class CharacterView: UIView {
    
    lazy var titleLabel = makeTitleLabel()
    lazy var statusLabel = makeStatusLabel()
    lazy var humanLabel = makeHumanLabel()
    lazy var locationLabel = makeLocationLabel()
    lazy var markerLocation = makeMarkerLocation()
    
    func setView() {
        titleLabel.backgroundColor = .clear
        statusLabel.backgroundColor = .clear
        humanLabel.backgroundColor = .clear
        locationLabel.backgroundColor = .clear
        markerLocation.backgroundColor = .clear
    }
}

extension CharacterView {
    func makeTitleLabel () -> UILabel {
        let label = UILabel()
        label.text = "Rick Sanched"
        label.sizeToFit()
        label.translatesAutoresizingMaskIntoConstraints = false
        addSubview(label)
        label.topAnchor.constraint(equalTo: topAnchor).isActive = true
        label.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        label.widthAnchor.constraint(equalToConstant: frame.width / 2).isActive = true
        label.heightAnchor.constraint(equalToConstant: frame.height / 5).isActive = true
        label.font = label.font.withSize(14)
        return label
    }
    
    func makeStatusLabel() -> UILabel {
        let label = UILabel()
        label.text = "UNKNOWED"
        label.textAlignment = .center
        label.sizeToFit()
        label.translatesAutoresizingMaskIntoConstraints = false
        addSubview(label)
        label.topAnchor.constraint(equalTo: topAnchor).isActive = true
        label.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
//        label.widthAnchor.constraint(equalToConstant: label.intrinsicContentSize.width / 1.21).isActive = true
        label.heightAnchor.constraint(equalToConstant: frame.height / 5).isActive = true
        label.font = label.font.withSize(label.frame.height / 1.75)
        return label
    }
    
    func makeHumanLabel () -> UILabel {
        let label = UILabel()
        label.text = "test"
        label.sizeToFit()
        label.translatesAutoresizingMaskIntoConstraints = false
        addSubview(label)
        label.topAnchor.constraint(equalTo: topAnchor, constant: frame.height / 4).isActive = true
        label.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        label.widthAnchor.constraint(equalToConstant: frame.width).isActive = true
        label.heightAnchor.constraint(equalToConstant: frame.height / 7).isActive = true
        label.font = label.font.withSize(label.frame.height / 1.5)
        return label
    }
    
    func makeLocationLabel () -> UILabel {
        let label = UILabel()
        label.text = "test"
        label.textColor = UIColor (red: 0.321, green: 0.321, blue: 0.321, alpha: 1)
        label.sizeToFit()
        label.translatesAutoresizingMaskIntoConstraints = false
        addSubview(label)
        label.topAnchor.constraint(equalTo: topAnchor, constant: frame.height / 1.16).isActive = true
        label.leftAnchor.constraint(equalTo: leftAnchor, constant: frame.width / 14.93).isActive = true
        label.widthAnchor.constraint(equalToConstant: frame.width).isActive = true
        label.heightAnchor.constraint(equalToConstant: frame.height / 7.05).isActive = true
        label.font = label.font.withSize(label.frame.height / 1.5)
        return label
    }
    
    func makeMarkerLocation() -> UIImageView {
        let image = UIImageView()
        image.image = UIImage(named: "location")
        image.translatesAutoresizingMaskIntoConstraints = false
        addSubview(image)
        image.topAnchor.constraint(equalTo: topAnchor, constant: frame.height / 1.16).isActive = true
        image.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        image.widthAnchor.constraint(equalToConstant: frame.width / 20.49).isActive = true
        image.heightAnchor.constraint(equalToConstant: frame.height / 7).isActive = true
        return image
    }
}
