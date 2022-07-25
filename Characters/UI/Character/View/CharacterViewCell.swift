//
//  CharacterViewCell.swift
//  Characters
//
//  Created by stimLite on 02.07.2022.
//

import UIKit

class CharacterViewCell: UITableViewCell {

    var avatarImageView: UIImageView = {
        let image = UIImageView()
        image.clipsToBounds = true
        image.backgroundColor = .gray
        return image
    }()
    
    var statusViewContiner: StatusViewContainer = {
        let view = StatusViewContainer()
        view.clipsToBounds = true
        view.backgroundColor = .gray
        return view
    }()
    
    var avatarImage: UIImage! {
        didSet {
            avatarImageView.image = avatarImage
        }
    }
    
//    let setStatus: ((String) -> Void)
    
    let containerView: ContainerWatcheView = {
        let view = ContainerWatcheView()
        view.backgroundColor = UIColor (red: 1, green: 0.42, blue: 0, alpha: 0.1)
        return view
    }()
    
    let characterView: CharacterView = {
        let view = CharacterView()
        view.clipsToBounds = true
//        view.statusLabel.backgroundColor = .red
        return view
    }()
    
    
    func configerationViewCell () {
        
        avatarImageView.frame = CGRect (x: frame.width / 17.83, y: frame.height / 9.5,
                                    width: frame.height / 1.26, height: frame.height / 1.26)
        avatarImageView.layer.cornerRadius = avatarImageView.frame.height / 3
       
        characterView.frame = CGRect (x: frame.width / 2.64, y: frame.height / 9.5,
                                      width: frame.width / 1.76, height: frame.height / 1.26)
        
        containerView.frame = CGRect (x: 0, y: characterView.frame.height / 2.06,
                                      width: characterView.frame.width / 1.90,
                                      height: characterView.frame.height / 3.42)
        containerView.layer.cornerRadius = containerView.frame.height / 2
        
        statusViewContiner.frame = CGRect (x: characterView.frame.width / 2, y: 0,
                                   width: characterView.frame.width / 2, height: characterView.frame.height / 4.8)
        statusViewContiner.layer.cornerRadius = statusViewContiner.frame.height / 2
        
//        statusView.frame = CGRect (x: characterView.frame.width / 2, y: characterView.frame.height,
//                                   width: characterView.frame.width / 2, height: characterView.frame.height / 4.8)
        
//        characterView.statusLabel.textColor =  UIColor(red: 0.194, green: 0.625, blue: 0.086, alpha: 1)
        
        addSubview(avatarImageView)
        addSubview(characterView)
        characterView.addSubview(containerView)
        characterView.addSubview(statusViewContiner)
        containerView.setView()
//        characterView.setView()
    }
    
    func updateStatus () {
        
        
        let statusString = statusViewContiner.statusView.text
        guard let statusString = statusString else { return }
        
        setStatus(for: statusString.lowercased())
    }
    
    func setStatus (for status: String) {
        statusViewContiner.layoutIfNeeded()
        switch SetStatus(status) {
        case .alive:
//            characterView.setView()
            statusViewContiner.layoutIfNeeded()
            statusViewContiner.statusView.backgroundColor = UIColor(red: 0.78, green: 1, blue: 0.725, alpha: 1)
            statusViewContiner.statusView.textColor =  UIColor(red: 0.194, green: 0.625, blue: 0.086, alpha: 1)
        case .dead:
            statusViewContiner.layoutIfNeeded()
            statusViewContiner.statusView.backgroundColor = UIColor(red: 1, green: 0.908, blue: 0.879, alpha: 1)
            statusViewContiner.statusView.textColor =  UIColor(red: 0.913, green: 0.219, blue: 0, alpha: 1)
        case .unknown:
            statusViewContiner.layoutIfNeeded()
            statusViewContiner.statusView.backgroundColor = UIColor(red: 0.933, green: 0.933, blue: 0.933, alpha: 1)
            statusViewContiner.statusView.textColor =  UIColor(red: 0.629, green: 0.629, blue: 0.629, alpha: 1)
        case .none:
            print ("none")
        }
    }
    
    func updateImage () {
        print(#function)
//        print (callback)
    }
    
}

enum SetStatus: String {
    case alive
    case dead
    case unknown
    case none
    
    var message: String {
        switch self {
        case .alive:
            return "Status alive"
        case .dead:
            return "Status dead"
        case .unknown:
            return "Status unknown"
        case .none:
            return "Status none"
            
        }
    }
    
    init (_ value: String) {
        switch value {
        case "alive":
            self = .alive
        case "dead":
            self = .dead
        case "unknown":
            self = .unknown
        default:
            self = .none
        }
    }
}
