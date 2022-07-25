//
//  StatusView.swift
//  Characters
//
//  Created by stimLite on 22.07.2022.
//

import UIKit

class StatusViewContainer: UIView {
    lazy var statusView = makeStatusView()
    
    func setFuncStatus () {
        statusView.backgroundColor = .clear
        statusView.textColor = .clear
    }
}

extension StatusViewContainer {
    func makeStatusView () -> UILabel {
        let label = UILabel()
        label.textAlignment = .center
        label.backgroundColor = .gray
        label.sizeToFit()
        label.translatesAutoresizingMaskIntoConstraints = false
        addSubview(label)
        label.topAnchor.constraint(equalTo: topAnchor).isActive = true
        label.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        label.widthAnchor.constraint(equalTo: widthAnchor).isActive = true
        label.heightAnchor.constraint(equalTo: heightAnchor).isActive = true
        return label
    }
}
