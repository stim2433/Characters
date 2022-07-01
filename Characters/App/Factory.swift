//
//  Factory.swift
//  Characters
//
//  Created by stimLite on 01.07.2022.
//

import UIKit


class Factory {
    func buildCharacters () -> UIViewController {
        let view = ViewController()
        return view
    }
}
