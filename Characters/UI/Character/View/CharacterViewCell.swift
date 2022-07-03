//
//  CharacterViewCell.swift
//  Characters
//
//  Created by stimLite on 02.07.2022.
//

import UIKit

class CharacterViewCell: UITableViewCell {
    
    let avatarImage: UIImageView = {
        let image = UIImageView()
        image.backgroundColor = .gray
        return image
    }()
    
    let containerView: ContainerWatcheView = {
        let view = ContainerWatcheView()
        view.backgroundColor = UIColor (red: 1, green: 0.42, blue: 0, alpha: 0.1)
        return view
    }()
    
    let characterView = CharacterView()
    
    func configerationViewCell () {
        
        avatarImage.frame = CGRect (x: frame.width / 17.83, y: frame.height / 9.5,
                                    width: frame.height / 1.26, height: frame.height / 1.26)
        avatarImage.layer.cornerRadius = avatarImage.frame.height / 3
        characterView.frame = CGRect (x: frame.width / 2.64, y: frame.height / 9.5,
                                      width: frame.width / 1.76, height: frame.height / 1.26)
        
        containerView.frame = CGRect (x: 0, y: characterView.frame.height / 2.06,
                                      width: characterView.frame.width / 1.90,
                                      height: characterView.frame.height / 3.42)
        containerView.layer.cornerRadius = containerView.frame.height / 2
        
        addSubview(avatarImage)
        addSubview(characterView)
        characterView.addSubview(containerView)
        
        characterView.setView()
        containerView.setView()
    }
    
}
