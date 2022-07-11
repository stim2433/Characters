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
    func settingView (view: CharacterViewProtocol, network: NetworckService<Endpoint>)
    func printStarus ()
    func getData()
    func getImage()
    func test(status: String) -> String
    
    var dataModel: CharacterData? { get set }
    var dataImage: Data? { get set }
}

class CharacterViewPresenter: CharacterViewPresenterProtocol {
    weak var view: CharacterViewProtocol?
    var network: NetworckService<Endpoint>!
    
    var dataModel: CharacterData?
    var dataImage: Data?
    
    func settingView(view: CharacterViewProtocol, network: NetworckService<Endpoint>) {
        self.view = view
        self.network = network
    }
    
    func printStarus() {
        view?.saccess()
    }
    
    func getData () {
        
        network.load(service: .region, dataType: CharacterData.self) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let modelData):
                self.dataModel = modelData
                self.view?.saccess()
            case .failure(let error):
                self.view?.errors()
            }
        }
    }
    func getImage () {
        network.load(service: .avatar("1")){ [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let imageData):
                self.dataImage = imageData
                self.view?.update()
            case .failure(let error):
                self.view?.errors()
            }
        }
    }
    
    func test (status: String) -> String {
//        print(status)
        return status
    }
    
}
