//
//  CharacterModel.swift
//  Characters
//
//  Created by stimLite on 01.07.2022.
//

import Foundation
import UIKit
//import CoreImage

struct CharacterData: Decodable {
    let results: [ResultsData]
}

struct ResultsData: Decodable {
    let id: Int
    let name: String
    let status: String
    let gender: String
}


