//
//  CharacterListDataStore.swift
//  HathwayAssignment
//
//  Created by Vidya Sravani on 7/15/21.
//

import Foundation

protocol CharacterListDataStoreProtocol {
    var marvelCharacters: [MarvelCharacter] { get set }
    var isLoadingMore: Bool { get set }
}

final class CharacterListDataStore: CharacterListDataStoreProtocol {
    var marvelCharacters: [MarvelCharacter] = []
    var isLoadingMore: Bool = false
}

