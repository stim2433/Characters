//
//  Factory.swift
//  Characters
//
//  Created by stimLite on 01.07.2022.
//

import UIKit


class Factory {
    func buildCharacters () -> UIViewController {
        let view = CharacterViewController()
        let presenter = CharacterViewPresenter()
        presenter.settingView(view: view)
        view.presenter = presenter
        return view
    }
}
