//
//  CharacterPresenter.swift
//  Characters
//
//  Created by stimLite on 01.07.2022.
//

import Foundation
import UIKit


protocol CharacterViewProtocol: AnyObject {
    func saccess()
    func update()
    func errors()
}

protocol CharacterViewPresenterProtocol: AnyObject {
    func settingView (view: CharacterViewProtocol, network: NetworckService<Endpoint>)
    func printStarus ()
    func getData()
    func getImage(strUrl: String?, index: IndexPath)
    
    var dataModel: CharacterData? { get set }
    var imageModel: Data? { get set }
    
    var callBack: ((IndexPath) -> Void)! { get set }
}

class CharacterViewPresenter: CharacterViewPresenterProtocol {
    weak var view: CharacterViewProtocol?
    var network: NetworckService<Endpoint>!
    
    var dataModel: CharacterData?
    var imageModel: Data?
    var callBack: ((IndexPath) -> Void)!
    
    var test: ((Data) -> Void)!
    
    
    var images: [Data]!

    var dataModels: ((CharacterData) -> Void)?
    
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
    
    func getImage (strUrl: String?, index: IndexPath) {
        
        let testStr = strUrl?.split(separator: "/")
        let idImage = testStr?.last
        guard let idImage = idImage else { return }
        
        network.load(service: .avatar(String(idImage))){ [weak self] result in
            guard let self = self else { return }

            switch result {
            case .success(let imageData):
                self.imageModel = imageData
                self.callBack(index)
                self.view?.update()
            case .failure(let error):
                self.view?.errors()
            }
        }
    }
    
    func update () {
    }
    
    func test (status: String) -> String {
        return status
    }
    
}
