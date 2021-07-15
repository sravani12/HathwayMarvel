//
//  CharacterListModels.swift
//  HathwayAssignment
//
//  Created by Vidya Sravani on 7/15/21.
//

import Foundation

enum CharacterList {
    enum FetchCharacterList {
        struct Request {}
        enum Response {
            struct Success {
                let marvelCharacters: [MarvelCharacter]
            }
            struct Failure {}
        }
        enum ViewModel {
            struct Success {
                let marvelCharacters: [MarvelCharacter]
            }
            struct Failure {
                let title: String
                let description: String
                let okButton: String
            }
        }
    }
}

