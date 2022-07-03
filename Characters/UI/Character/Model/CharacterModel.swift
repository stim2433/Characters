//
//  CharacterModel.swift
//  Characters
//
//  Created by stimLite on 01.07.2022.
//

import Foundation
import UIKit
//import CoreImage


enum CharacterViewModel {
    case initial
    case loading(CharacterData)
    case saccess(CharacterData)
    case failure(ErrorData)
    
    
    struct CharacterData {
        let background: UIColor
//        let results: [ResultsData]
    }
    
    struct ResultsData {
        let id: Int
        let name: String
        let status: String
        let gender: String
    }
    
    struct ErrorData {
        let background: UIColor
    }
}
