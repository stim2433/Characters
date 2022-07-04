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
        let network = NetworckService<Endpoint>()
        presenter.settingView(view: view, network: network)
        view.presenter = presenter
        return view
    }
}
