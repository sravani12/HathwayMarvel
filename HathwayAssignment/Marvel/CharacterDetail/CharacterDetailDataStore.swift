//
//  CharacterDetailDataStore.swift
//  HathwayAssignment
//
//  Created by Vidya Sravani on 7/15/21.
//

import Foundation

protocol CharacterDetailDataStoreProtocol {
    var marvelCharacter: MarvelCharacter { get }
}

final class CharacterDetailDataStore: CharacterDetailDataStoreProtocol {
    var marvelCharacter: MarvelCharacter

    init(marvelCharacter: MarvelCharacter) {
        self.marvelCharacter = marvelCharacter
    }
}

