//
//  CharacterPresenter.swift
//  Characters
//
//  Created by stimLite on 01.07.2022.
//

import Foundation


protocol CharacterViewProtocol: AnyObject {
    func saccess()
    func update()
    func errors()
}

protocol CharacterViewPresenterProtocol: AnyObject {
    func settingView (view: CharacterViewProtocol)
    func printStarus ()
}

class CharacterViewPresenter: CharacterViewPresenterProtocol {
    weak var view: CharacterViewProtocol?
    
    func settingView(view: CharacterViewProtocol) {
        self.view = view
    }
    
    func printStarus() {
        view?.errors()
    }
    
}
