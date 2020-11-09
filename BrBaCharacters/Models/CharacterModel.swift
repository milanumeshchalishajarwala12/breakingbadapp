//
//  CharacterModel.swift
//  BrBaCharacters
//
//  Created by Milan Chalishajarwala on 10/13/20.
//

import Foundation

struct CharacterModel: Codable{
    let char_id: Int16?
    let birthday: String?
    let category: String?
    let img: String?
    let name: String?
    let nickname: String?
    let status: String?
    let portrayed: String?
    let appearance: [Int16]?
    let better_call_saul_appearance: [Int16]?
    let occupation: [String]?
}
