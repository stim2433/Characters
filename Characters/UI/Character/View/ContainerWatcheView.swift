//
//  ContainerWatcheView.swift
//  Characters
//
//  Created by stimLite on 03.07.2022.
//

import UIKit


class ContainerWatcheView: UIView {
    lazy var watchLabel = makeWatchLabel()
    lazy var markerPlay = makeMarkerPlay()
    
    func setView () {
        watchLabel.backgroundColor = .clear
        markerPlay.backgroundColor = .clear
    }
    
}

extension ContainerWatcheView {
    func makeWatchLabel () -> UILabel {
        let label = UILabel()
        label.text = "Watch"
        label.textColor = UIColor (red: 1, green: 0.42, blue: 0, alpha: 1)
        label.sizeToFit()
        label.translatesAutoresizingMaskIntoConstraints = false
        addSubview(label)
        label.topAnchor.constraint(equalTo: topAnchor, constant: frame.height / 3.88).isActive = true
        label.leftAnchor.constraint(equalTo: leftAnchor, constant: frame.width / 4.93).isActive = true
        label.widthAnchor.constraint(equalToConstant: frame.width / 1.39).isActive = true
        label.heightAnchor.constraint(equalToConstant: frame.height / 2.05).isActive = true
        label.font = label.font.withSize(label.frame.height / 1.75)
        return label
    }
    
    func makeMarkerPlay () -> UIImageView {
        let image = UIImageView()
        image.image = UIImage(named: "play")
        image.translatesAutoresizingMaskIntoConstraints = false
        addSubview(image)
        image.topAnchor.constraint(equalTo: topAnchor, constant: frame.height / 2.69).isActive = true
        image.leftAnchor.constraint(equalTo: leftAnchor, constant: frame.width / 12.33).isActive = true
        image.widthAnchor.constraint(equalToConstant: frame.width / 14.8).isActive = true
        image.heightAnchor.constraint(equalToConstant: frame.height / 2.91).isActive = true
        return image
    }
}
